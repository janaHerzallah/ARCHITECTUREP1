.data
dashes_prompt: .asciiz "--------------------------------------------\n"
welcome_prompt: .asciiz "Welcome to Medical Test Management System\n"
file_path_prompt: .asciiz "Enter the file path:\n "
filename: .space 256 # Allocate space for file path
file_not_found_msg: .asciiz "File not found or path incorrect. Please try again.\n"
file_contents: .asciiz "\nMedical file contents:\n"


buffer: .space 2000 # Buffer to store file contents
new_buffer: .space 2000 # Buffer to store file contents


sum: .float 0.0
count: .word 0

##############


####1201139
#1200071
integerPart: .word 0       # Space for the integer part
fractionalPart: .word 0    # Space for the fractional part as an integer
scale: .word 1             # Scale
resultString: .space 12 #buffer to save the float results  
counter: .float 7.0  # The divisor for calculating the average
MSG1: .asciiz "Converted Float: "
eachFLOAT: .asciiz "EACH Float: \n"
ACCUMFLOAT: .asciiz "ACCUMFLOAT: \n"

outputString: .space 50

messageHgb: .asciiz "Average Hgb: "
messageBGT: .asciiz "Average BGT: "
messageLDL: .asciiz "Average LDL: "
messageBPT: .asciiz "Average BPT: "


zero_float: .float 0.0   # Define a floating point zero constant in data segment


# for normal and unnormal test ---------------------
    lowerBoundHgb: .float 13.8
    upperBoundHgb: .float 17.2
    lowerBoundBGT: .float 70.0
    upperBoundBGT: .float 99.0
    upperBoundLDL: .float 100.0
    upperBoundSystolicBPT: .float 120.0
    upperBoundDiastolicBPT: .float 80.0
    
    inputPrompt: .asciiz "\nEnter the Patient ID'): "  
    inputBuffer_ID: .space 11  # Buffer for search id 
    error_msg: .asciiz "Failed to open the file.\n"
    
    
#end of normal and unnormal test ---------------------




######################3
# Padding to align ids_array properly
.align 3
ids_array: .space 1000 # Array to store integer IDs

menu_prompt: .asciiz "\n\nMedical Test System Menu\n1. Add a new medical test\n2. Search for a test by patient ID\n3. Searching for unnormal tests\n4. Average test value\n5. Update an existing test result\n6. Delete a test\n7. Exit programm\nEnter your choice (1-7): \n"

invalid_choice_msg: .asciiz "\nInvalid choice. Please enter a number between 1 and 7.\n"

patient_id_prompt: .asciiz "\nEnter patient ID: "

test_value_prompt: .asciiz "\nEnter test name: "

year_prompt: .asciiz "\nEnter year (as 4 digits yyyy): "
month_prompt: .asciiz "\nEnter month (as 2 digits mm): "


result_prompt: .asciiz "\nEnter test result : "

patient_id: .space 20
test_name: .space 20
year_buffer: .space 7 # maximum length of year is 4 digits plus null terminator
month_buffer: .space 7 # maximum length of month is 2 digits plus null terminator

test_result: .space 8 # Buffer to store the date string



second_menu_options: .asciiz "\nSecond Menu Options:\n1. Retrieve all patient tests\n2. Retrieve all abnormal patient tests\n3. Retrieve all patient tests in a specific period\n4. Return to main menu\n"
second_menu_prompt: .asciiz "\nEnter your choice (1-4): "


update_test_prompt: .asciiz "\nEnter the new test result: "

 

search_period_prompt: .asciiz "\nEnter the start and end period (e.g., 202203 202204): "

newline: .asciiz "\n" # new line

colon_space: .asciiz ": "

comma_space: .asciiz ", "

# Buffer to hold the concatenated string
output_string: .space 256 # Adjust the size as needed

 

.text
.globl main

main:


# Display dashes prompt
li $v0, 4 # syscall code for print_string
la $a0, dashes_prompt # load address of the prompt string
syscall

# Display welcome prompt for user
li $v0, 4 # syscall code for print_string
la $a0, welcome_prompt # load address of the prompt string
syscall

# Display dashes prompt
li $v0, 4 # syscall code for print_string
la $a0, dashes_prompt # load address of the prompt string
syscall

# Display prompt for enter file_path
li $v0, 4 # syscall code for print_string
la $a0, file_path_prompt # load address of the prompt string
syscall

# Read file path from user
file_path_input:
li $v0, 8 # syscall code for read_string
la $a0, filename # load address of the file_path buffer
li $a1, 256 # maximum number of characters to read
syscall

#replace \n at the last of file path input with \0
li $t0, 0 # counter
replace_newline:
lb $t1, filename($t0) # load a character from file_path
beqz $t1, end_replace # if null character, exit loop
beq $t1, 10, replace # if newline character, replace
addi $t0, $t0, 1 # increment counter
j replace_newline
replace:
li $t2, 0x0 # load null character
sb $t2, filename($t0) # store null character
end_replace:

# File path is now stored in filename

# Call readtestFile function
# if the file read correctly :
jal readtestFile # Call the function
li $t0, 0
j file_readed_succesfully # continue with the program

# else the file read correctly :

file_open_failed:

# Display dashes prompt
li $v0, 4 # syscall code for print_string
la $a0, file_not_found_msg # load address of the prompt string
syscall

j file_path_input #write another valid

file_readed_succesfully:



# Prompt user for medical data
li $v0, 4 # Print string syscall
la $a0, patient_id_prompt
syscall


# Read integer input from user
li $v0, 5 # Read integer syscall
syscall
move $t9, $v0 # Move the input integer to $t9




# Load the address of the buffer into $a3
la $a3, buffer

# Initialize index for storing IDs in the array
li $t0, 0

li $t3, 0x3A # ASCII value for ':


# Initialize the flag register (this to make sure if the id stored to go to the next id
li $t7, 0

li $a1, 0

move $t0, $zero # $t0 is now zero
mult $t0, $zero # the result of the multiplication is zero, stored in `lo` and `hi`
mflo $31 # move the result from `lo` to `lo`, this is effectively a reset


iterate_file_lines:

#-----------------------------------
#start reading id in each line :
#-----------------------------------

# Load a byte from memory into $a1
lb $a1, 0($a3)
# Check if the byte is null terminator '\0'
beq $a1, $zero, end_file # If null terminator found, end parse loop


# Check if flag t7 is 0 ; if it is 0 then extract the id by going to continue_parsing and then check if it is equal to the input id
#if it is 1 go to the next line to extract new id
beq $t7, $zero, combine_id




# Walk in the buffer until "\n" is found
skip_till_newline:
# Load a byte from memory into $a1
lb $a1, 0($a3)

# Check if the byte is null terminator '\0'
beq $a1, $zero, end_file # If null terminator found, end parse loop


# Check if the byte is newline character '\n'
li $t8, 0x0A # ASCII value for '\n'
beq $a1, $t8, reset_flag_to_compine_new_id # If newline found, reset flag and continue parsing

# Move to the next byte in the buffer
addi $a3, $a3, 1

j skip_till_newline

reset_flag_to_compine_new_id:
# Reset flag t7
li $t7, 0

# Load a byte from memory into $a1
lb $a1, 0($a3)
# Check if the byte is null terminator '\0'
beq $a1, $zero, end_file # If null terminator found, end parse loop

# Continue parsing loop
j iterate_file_lines

combine_id:
# Load a byte from memory into $a1
lb $a1, 0($a3)

# Check if the byte is a digit or a (:) colon
li $t1, 0x30 # ASCII value for '0'
beq $a1, $t3, the_id_is_in_t4

# Store str
# Store date
# Store result

blt $a1, $t1, next_byte

# Convert ASCII digit to integer and add to ID
sub $a1, $a1, $t1 # Convert ASCII to integer
mul $t4, $t4, 10 # Multiply current ID by 10
add $t4, $t4, $a1 # Add new digit to ID

# Move to the next byte in the buffer
addi $a3, $a3, 1

# Repeat the loop
j iterate_file_lines

next_byte:
# Move to the next byte in the buffer
addi $a3, $a3, 1

# Repeat the loop
j iterate_file_lines



the_id_is_in_t4:

#brint the line if the id = user input
beq $t4, $t9, desired_id # Branch to equal_branch if $t4 is equal to $t9
# Code to execute if $t4 is not equal to $t9
j next_line # Jump to next_instruction

desired_id :

# Reset $t4 for next ID
li $t5, 0

# Move to the next byte in the buffer
addi $a3, $a3, 7
# Load a byte from memory into $a1
lb $a1, 0($a3)

# Check if the byte is a digit or a (:) colon
li $t1, 0x30 # ASCII value for '0'


# Convert ASCII digit to integer and add to ID
sub $a1, $a1, $t1 # Convert ASCII to integer
mul $t5, $t5, 10 # Multiply current ID by 10
add $t5, $t5, $a1 # Add new digit to ID


# Print the content of $t5
li $v0, 1 # System call for print integer
move $a0, $t5 # Move the content of $t4 to $a0 for printing
syscall

# Print new line
li $v0, 4 # System call for print string
la $a0, newline # Load the address of the new line string
syscall



# Move to the next byte in the buffer
addi $a3, $a3, 1
# Load a byte from memory into $a1
lb $a1, 0($a3)

# Check if the byte is a digit or a (:) colon
li $t1, 0x30 # ASCII value for '0'


# Convert ASCII digit to integer and add to ID
sub $a1, $a1, $t1 # Convert ASCII to integer
mul $t5, $t5, 10 # Multiply current ID by 10
add $t5, $t5, $a1 # Add new digit to ID


# Print the content of $t5
li $v0, 1 # System call for print integer
move $a0, $t5 # Move the content of $t4 to $a0 for printing
syscall

# Print new line
li $v0, 4 # System call for print string
la $a0, newline # Load the address of the new line string
syscall

# Move to the next byte in the buffer
addi $a3, $a3, 1
# Load a byte from memory into $a1
lb $a1, 0($a3)

# Check if the byte is a digit or a (:) colon
li $t1, 0x30 # ASCII value for '0'


# Convert ASCII digit to integer and add to ID
sub $a1, $a1, $t1 # Convert ASCII to integer
mul $t5, $t5, 10 # Multiply current ID by 10
add $t5, $t5, $a1 # Add new digit to ID

# Print the content of $t5
li $v0, 1 # System call for print integer
move $a0, $t5 # Move the content of $t4 to $a0 for printing
syscall

# Print new line
li $v0, 4 # System call for print string
la $a0, newline # Load the address of the new line string
syscall


# Move to the next byte in the buffer
addi $a3, $a3, 1
# Load a byte from memory into $a1
lb $a1, 0($a3)

# Check if the byte is a digit or a (:) colon
li $t1, 0x30 # ASCII value for '0'


# Convert ASCII digit to integer and add to ID
sub $a1, $a1, $t1 # Convert ASCII to integer
mul $t5, $t5, 10 # Multiply current ID by 10
add $t5, $t5, $a1 # Add new digit to ID

# Print the content of $t5
li $v0, 1 # System call for print integer
move $a0, $t5 # Move the content of $t4 to $a0 for printing
syscall

# Print new line
li $v0, 4 # System call for print string
la $a0, newline # Load the address of the new line string
syscall

jal print_specific_line # Call print_specific_line if $t4 is equal to $t9

next_line:

# Reset $t4 for next ID
li $t4, 0


# Continue with the next instruction

#jal print_specific_line

# Increment loop counter
addi $t0, $t0, 1


# Move to the next byte in the buffer
addi $a3, $a3, 1

# Load a byte from memory into $a1
lb $a1, 0($a3)

# Set flag to indicate an ID has been found
li $t7, 1


# Continue parsing loop
j iterate_file_lines

end_file:



# Display menu
menu:
li $v0, 4
la $a0, menu_prompt
syscall

enter_valid_choice:
# Read user choice
li $v0, 5
syscall

# Branch based on user choice
beq $v0, 1, add_test
beq $v0, 2, search_test_by_id
beq $v0, 3, retrieve_all_up_normal_tests
beq $v0, 4, average_test_value
beq $v0, 5, update_test
beq $v0, 6, delete_test
beq $v0, 7,end_programm
beq $v0, 8,SearchUnNORMAL


# Invalid choice
li $v0, 4
la $a0, invalid_choice_msg
syscall

# Return to menu
j enter_valid_choice #it was jum to menu and display minu in each unvalid choice !!!!

 

 


# Function To read and print file contents: readtestFile
readtestFile:
# Open the file
li $v0, 13 # syscall code for open file
la $a0, filename # load address of filename
li $a1, 0 # open for read-only
syscall
move $s0, $v0 # store file descriptor


# Check if file opened successfully
blt $v0, $zero, file_open_failed # branch if $v0 < 0 (file failed to open)

 


# Read from the file
read_loop:
li $v0, 14 # syscall code for read file
move $a0, $s0 # file descriptor
la $a1, buffer # load address of buffer
li $a2, 256 # maximum number of bytes to read
syscall

# Check if end of file
beq $v0, 0, end_read # exit loop if end of file


# Display dashes prompt
li $v0, 4 # syscall code for print_string
la $a0, file_contents # load address of the prompt string
syscall

# Print the contents read
li $v0, 4 # syscall code for print_string
move $a0, $a1 # load address of buffer
syscall

j read_loop # repeat read loop

end_read:
# Close the file
li $v0, 16 # syscall code for close file
move $a0, $s0 # file descriptor
syscall

jr $ra # return from the function



add_test:

# Prompt user for medical data
li $v0, 4 # Print string syscall
la $a0, patient_id_prompt
syscall

li $v0, 8 # Read string syscall
la $a0, patient_id
li $a1, 20 # Maximum length of patient ID
syscall

# Append patient ID to output_string
move $s0, $zero # Initialize index for output_string
la $s1, output_string # Load address of output_string


# Append a newline character at the beginning of output_string
la $s3, output_string # Load address of output_string
li $t0, '\n' # Load newline character
sb $t0, 0($s3) # Store newline character at the beginning of output_string
addi $s2, $s2, 1 # Increment string length counter


addi $s1, $s1, 1 # Increment index for output_string

 

append_loop_id:
lb $t0, patient_id($s0) # Load byte from patient_id
beq $t0, 10, end_append_id # Check if byte is newline character

sb $t0, 0($s1) # Store byte to output_string
addi $s0, $s0, 1 # Increment index for patient_id
addi $s1, $s1, 1 # Increment index for output_string
j append_loop_id

end_append_id:

# Append ": " after patient ID
li $t0, ':' # Load colon character
sb $t0, 0($s1) # Store colon character to output_string
addi $s1, $s1, 1 # Increment index for output_string
li $t0, ' ' # Load space character
sb $t0, 0($s1) # Store space character to output_string
addi $s1, $s1, 1 # Increment index for output_string

# Prompt user for test name
li $v0, 4
la $a0, test_value_prompt
syscall

li $v0, 8
la $a0, test_name
li $a1, 20
syscall

# Append test name to output_string
move $s0, $zero # Reset index for test_name
append_loop_test_name:
lb $t0, test_name($s0) # Load byte from test_name
beq $t0, 10, end_append_test_name # Check if byte is newline character

sb $t0, 0($s1) # Store byte to output_string
addi $s0, $s0, 1 # Increment index for test_name
addi $s1, $s1, 1 # Increment index for output_string
j append_loop_test_name

end_append_test_name:

# Append ", " after test name
li $t0, ',' # Load comma character
sb $t0, 0($s1) # Store comma character to output_string
addi $s1, $s1, 1 # Increment index for output_string
li $t0, ' ' # Load space character
sb $t0, 0($s1) # Store space character to output_string
addi $s1, $s1, 1 # Increment index for output_string

# Prompt user for year
li $v0, 4
la $a0, year_prompt
syscall

li $v0, 8
la $a0, year_buffer
li $a1, 6 # Maximum length of year
syscall

# Append year to output_string
move $s0, $zero # Reset index for year_buffer
append_loop_year:
lb $t0, year_buffer($s0) # Load byte from year_buffer
beq $t0, 10, end_append_year # Check if byte is newline character

sb $t0, 0($s1) # Store byte to output_string
addi $s0, $s0, 1 # Increment index for year_buffer
addi $s1, $s1, 1 # Increment index for output_string
j append_loop_year

end_append_year:

# Append "-" after year
li $t0, '-' # Load dash character
sb $t0, 0($s1) # Store dash character to output_string
addi $s1, $s1, 1 # Increment index for output_string

# Prompt user for month
li $v0, 4
la $a0, month_prompt
syscall

li $v0, 8
la $a0, month_buffer
li $a1, 6 # Maximum length of month
syscall

# Append month to output_string
move $s0, $zero # Reset index for month_buffer
append_loop_month:
lb $t0, month_buffer($s0) # Load byte from month_buffer
beq $t0, 10, end_append_month # Check if byte is newline character

sb $t0, 0($s1) # Store byte to output_string
addi $s0, $s0, 1 # Increment index for month_buffer
addi $s1, $s1, 1 # Increment index for output_string
j append_loop_month

end_append_month:

# Append ", " after month
li $t0, ',' # Load comma character
sb $t0, 0($s1) # Store comma character to output_string
addi $s1, $s1, 1 # Increment index for output_string
li $t0, ' ' # Load space character
sb $t0, 0($s1) # Store space character to output_string
addi $s1, $s1, 1 # Increment index for output_string

 

li $v0, 4
la $a0, result_prompt
syscall

li $v0, 8
la $a0, test_result
li $a1, 8 # Maximum length of date
syscall


# Append test result to output_string
move $s0, $zero # Reset index for test_result
append_loop_result:
lb $t0, test_result($s0) # Load byte from test_result
beq $t0, 10, end_append_result
sb $t0, 0($s1) # Store byte to output_string
addi $s0, $s0, 1 # Increment index for test_result
addi $s1, $s1, 1 # Increment index for output_string
j append_loop_result

end_append_result:

# Print output_string
li $v0, 4 # Print string syscall
la $a0, output_string
syscall



# Calculate the length of the output_string
move $s2, $zero # Initialize counter for string length
la $s3, output_string # Load address of output_string

calc_string_length:
lb $t0, 0($s3) # Load byte from output_string
beqz $t0, end_calc_string_length # If byte is zero (end of string), exit loop
addi $s2, $s2, 1 # Increment string length counter
addi $s3, $s3, 1 # Move to the next byte of the string
j calc_string_length

end_calc_string_length:

 

 

# Open file for writing (create if not exist)
li $v0, 13 # Open syscall
la $a0, filename # Load file path
li $a1, 9 # Open for writing (create if not exist)
li $a2, 0 # File permissions
syscall
move $s0, $v0 # Save file descriptor

 

# Write into the file
li $v0, 15 # write_file syscall code = 15
move $a0, $s0 # File descriptor (fileName)
la $a1, output_string # The text that will be written in the file
move $a2, $s2 # File size (length of the string)
syscall

# Close file
li $v0, 16 # Close syscall
move $a0, $s0 # File descriptor
syscall


#Clear buffer and write file into it again

# Prompt user for medical data
#li $v0, 4 # Print string syscall
#la $a0, buffer
#syscall


# clear_buffer
# Load the address of the buffer into a register
la $t0, buffer

# Set the number of bytes to clear
li $t1, 2000

jal clear_loop


# clear_buffer
# Load the address of the buffer into a register
la $t0, patient_id

# Set the number of bytes to clear
li $t1, 20

jal clear_loop


# clear_buffer
# Load the address of the buffer into a register
la $t0, test_name

# Set the number of bytes to clear
li $t1, 20

jal clear_loop


# clear_buffer
# Load the address of the buffer into a register
la $t0, test_name

# Set the number of bytes to clear
li $t1, 20

jal clear_loop


# clear_buffer
# Load the address of the buffer into a register
la $t0, year_buffer

# Set the number of bytes to clear
li $t1, 5

jal clear_loop



# clear_buffer
# Load the address of the buffer into a register
la $t0, month_buffer

# Set the number of bytes to clear
li $t1, 3

jal clear_loop



# clear_buffer
# Load the address of the buffer into a register
la $t0, test_result

# Set the number of bytes to clear
li $t1, 8

jal clear_loop



# Prompt user for medical data
li $v0, 4 # Print string syscall
la $a0, newline
syscall


jal readtestFile # Call the readtestFile function


# Prompt user for medical data
li $v0, 4 # Print string syscall
la $a0, newline
syscall


# Prompt user for medical data
li $v0, 4 # Print string syscall
la $a0, buffer
syscall







j menu


clear_loop:
# Store zero (null terminator) at the current address in the buffer
sb $zero, ($t0)

# Move to the next byte in the buffer
addi $t0, $t0, 1

# Decrement the byte counter
addi $t1, $t1, -1

# Check if all bytes have been cleared
bnez $t1, clear_loop

jr $ra # Return from the subroutine

 



search_test_by_id:

# Display second menu options
li $v0, 4
la $a0, second_menu_options
syscall

# Prompt user for choice
li $v0, 4
la $a0, second_menu_prompt
syscall

# Read user choice
li $v0, 5
syscall
move $t0, $v0 # Store user choice

# Process user choice
beq $t0, 1, retrieve_all_tests
beq $t0, 2, retrieve_abnormal_tests
beq $t0, 3, retrieve_tests_in_period
beq $t0, 4, return_to_main_menu
j invalid_choice

retrieve_all_tests:
# Code to retrieve all patient tests


# Prompt user for medical data
li $v0, 4 # Print string syscall
la $a0, patient_id_prompt
syscall


# Read integer input from user
li $v0, 5 # Read integer syscall
syscall
move $t9, $v0 # Move the input integer to $t9




# Load the address of the buffer into $a3
la $a3, buffer

# Initialize index for storing IDs in the array
li $t0, 0

li $t3, 0x3A # ASCII value for ':
# Load the base address of ids_array into $t5

la $t5, ids_array

# Initialize the flag register (this to make sure if the id stored to go to the next id
li $t7, 0

li $a1, 0


parse_loop:

#-----------------------------------
#start reading id in each line :
#-----------------------------------

# Load a byte from memory into $a1
lb $a1, 0($a3)
# Check if the byte is null terminator '\0'
beq $a1, $zero, search_test_by_id # If null terminator found, end parse loop


# Check if flag t7 is 0 ; if it is 0 then extract the id by going to continue_parsing and then check if it is equal to the input id
#if it is 1 go to the next line to extract new id
beq $t7, $zero, continue_parsing




# Walk in the buffer until "\n" is found
search_newline:
# Load a byte from memory into $a1
lb $a1, 0($a3)

# Check if the byte is null terminator '\0'
beq $a1, $zero, search_test_by_id # If null terminator found, end parse loop


# Check if the byte is newline character '\n'
li $t8, 0x0A # ASCII value for '\n'
beq $a1, $t8, reset_flag # If newline found, reset flag and continue parsing

# Move to the next byte in the buffer
addi $a3, $a3, 1

j search_newline

reset_flag:
# Reset flag t7
li $t7, 0

# Load a byte from memory into $a1
lb $a1, 0($a3)
# Check if the byte is null terminator '\0'
beq $a1, $zero, search_test_by_id # If null terminator found, end parse loop

# Continue parsing loop
j parse_loop

continue_parsing:
# Load a byte from memory into $a1
lb $a1, 0($a3)

# Check if the byte is a digit or a (:) colon
li $t1, 0x30 # ASCII value for '0'
beq $a1, $t3, store_id

# Store str
# Store date
# Store result

blt $a1, $t1, next_iteration

# Convert ASCII digit to integer and add to ID
sub $a1, $a1, $t1 # Convert ASCII to integer
mul $t4, $t4, 10 # Multiply current ID by 10
add $t4, $t4, $a1 # Add new digit to ID

# Move to the next byte in the buffer
addi $a3, $a3, 1

# Repeat the loop
j parse_loop

next_iteration:
# Move to the next byte in the buffer
addi $a3, $a3, 1

# Repeat the loop
j parse_loop



store_id:


# Each element in the array is 4 bytes (assuming 32-bit integers)
sll $t6, $t0, 2 # Multiply the index by 4 (shift left by 2) to account for each integer being 4 bytes

# Add the offset to the base address of ids_array
add $t5, $t5, $t6 # $t5 now holds the address of ids_array[index]

# Store the value of $t4 into the memory location pointed to by $t5
sw $t4, 0($t5) # Store the value of $t4 as a word at the calculated memory location



#brint the line if the id = user input
beq $t4, $t9, equal_branch # Branch to equal_branch if $t4 is equal to $t9
# Code to execute if $t4 is not equal to $t9
j next_instruction # Jump to next_instruction

equal_branch:
jal print_specific_line # Call print_specific_line if $t4 is equal to $t9

next_instruction:

# Reset $t4 for next ID
li $t4, 0


# Continue with the next instruction

#jal print_specific_line

# Increment loop counter
addi $t0, $t0, 1


# Move to the next byte in the buffer
addi $a3, $a3, 1

# Load a byte from memory into $a1
lb $a1, 0($a3)

# Set flag to indicate an ID has been found
li $t7, 1


# Continue parsing loop
j parse_loop



j search_test_by_id #to go to choice 2 minu again

 

invalid_choice:
# Invalid choice message
li $v0, 4
la $a0, invalid_choice_msg
syscall
j search_test_by_id




# Function to print a specific line from the buffer based on t0 value
print_specific_line:

# Print the specific line
la $k0, buffer # Load address of buffer_string
li $k1, 0 # Counter for newline characters
li $s5, 0 # Index for characters in buffer_string

loopp:
beq $t0, $zero, print_line
lb $t4, 0($k0) # Load a character from buffer_string
beq $t4, $zero, done # If it's null terminator, we're done

# Check for newline
beq $t4, '\n', Increment_newline_counter

# Move to next character
addi $k0, $k0, 1
addi $s5, $s5, 1
j loopp

Increment_newline_counter:
# Increment newline counter
addi $k1, $k1, 1
# Compare newline counter with line number
bne $k1, $t0, next_char
# Move to next character
addi $k0, $k0, 1
beq $k1, $t0, print_line
j done

next_char:
# Move to next character
addi $k0, $k0, 1
j loopp

print_line:
lb $t4, 0($k0) # Load a character from buffer_string

# Check for newline
beq $t4, '\n', done

# Print character
li $v0, 11
move $a0, $t4
syscall

 

# Move to next character
addi $k0, $k0, 1

j print_line

done:

# Print character
li $v0, 11
move $a0, $t4
syscall

jr $ra # Return from the subroutine

 


retrieve_abnormal_tests:
# Code to retrieve all abnormal patient tests
j search_test_by_id

retrieve_tests_in_period:
# Code to retrieve tests in a given specific period
j search_test_by_id

return_to_main_menu:
# Code to return to the main menu
j menu

 

####################################################################################
retrieve_all_up_normal_tests:






  # Prompt user for the test ID
    li $v0, 4
    la $a0, inputPrompt
    syscall

    # Read the test ID as a string
    li $v0, 8
    la $a0, inputBuffer_ID
    li $a1, 20
    syscall


li $s7, 0 # Initialize the flag to 0
la $a0, buffer # Load the address of the buffer into $a0


cheack_file_IDs:

    move $t9, $a0 # Save the address of the start of the buffer in $t7

    jal BoolIDCheck # f(a0 , inputbuffer_ID) retrun 1 in t5 if the ID is equal to the inputBuffer_ID

    #if the t5 = 1 mean the ID is equal to the inputBuffer_ID
    #else the ID is not equal to the inputBuffer_ID

    beq $t5, 1, check_test_resultNormal
    jal get_next_line
    beq $s7, 1, menu
    j cheack_file_IDs



  
    # Logic for printing the data after ID match

    #normal range for each test
    #1. Hemoglobin (Hgb): 13.8 to 17.2 grams per deciliter 
    #2. Blood Glucose Test (BGT): Normal Range Between 70 to 99 milligrams per deciliter (mg/dL) 
    #3. LDL Cholesterol Low-Density Lipoprotein (LDL): Normal Range Less than 100 mg/dL
    #4. Blood Pressure Test (BPT): Normal Range: Systolic Blood Pressure: Less than 120 millimeters of 
    #   mercury (mm Hg). Diastolic Blood Pressure: Less than 80 mm Hg 

check_test_resultNormal: 

            move $a0, $t9          # Load the address of the start of the line into $a0
            jal line_test_values # f(a0) retrun F1 = test result in floating point, t4 = type of test, a0 = start of the next line

            #-----------------------------------sum the values of the test result to calculate the average--------------------------------
            
            beq $t4, 1, Hgb_test_Normal
            beq $t4, 2, BGT_test_Normal
            beq $t4, 3, LDL_test_Normal
            beq $t4, 4, BPT_test_Normal


            Hgb_test_Normal:
                            lwc1 $f3, lowerBoundHgb # Load the lower bound value, which is 13.8
                            lwc1 $f4, upperBoundHgb # Load the upper bound value, which is 17.2

                            c.lt.s $f1, $f3         # Compare the test result in $f1 with the lower bound $f3
                            bc1t if_it_unnormal   # If the test result is less than the lower bound, branch to if_it_unnormal

                            c.le.s $f4, $f1         # Compare the test result in $f1 with the upper bound $f4
                            bc1t if_it_unnormal   # If the test result is greater than the upper bound, branch to if_it_unnormal

                            move $a0, $t9           # Load the address of the start of the line into $a0
                            jal printLine             # Jump to printLine to print the data for this line
                            
                            beq $s7, 1, menu # If the end of the file is reached, return to the menu
                            j cheack_file_IDs       # Continue to check file IDs							
                                                        
                                    
                    
            BGT_test_Normal:

                           lwc1 $f3, lowerBoundBGT # Load the lower bound value is 70.0
                           lwc1 $f4, upperBoundBGT # Load the upper bound value is 99.0

                           c.lt.s $f1, $f3         # Compare the test result in $f1 with the lower bound $f3
                           bc1t if_it_unnormal   # If the test result is less than the lower bound, branch to if_it_unnormal

                           c.le.s $f4, $f1         # Compare the test result in $f1 with the upper bound $f4
                           bc1t if_it_unnormal   # If the test result is greater than the upper bound, branch to if_it_unnormal
                           
                           move $a0, $t9          # Load the address of the start of the line into $a0
                           jal printLine          # f(a0) print the data for this line 

                           beq $s7, 1, menu
                           j  cheack_file_IDs                                        

            LDL_test_Normal:

                            lwc1 $f4, upperBoundLDL  # Load the upper bound value of 100.0 into $f3
                            c.le.s $f4, $f1          # Compare the test result in $f1 with the upper bound in $f3
                            bc1t if_it_unnormal    # If $f1 is not less than or equal to $f3 (i.e., $f1 is greater than $f3), branch to end_findNextLine

                            move $a0, $t9          # Load the address of the start of the line into $a0
                            jal printLine          # f(a0) print the data for this line 

                            beq $s7, 1, menu
                            j  cheack_file_IDs         
                        		
            BPT_test_Normal: 
                            lwc1 $f4, upperBoundSystolicBPT # Load the upper bound value is 120.0
                            lwc1 $f3, upperBoundDiastolicBPT # Load the upper bound value is 80.0

                            c.lt.s $f1, $f3         # Compare the test result in $f1 with the lower bound $f3
                            bc1t if_it_unnormal   # If the test result is less than the lower bound, branch to if_it_unnormal

                            c.le.s $f4, $f1         # Compare the test result in $f1 with the upper bound $f4
                            bc1t if_it_unnormal   # If the test result is greater than the upper bound, branch to if_it_unnormal

                            move $a0, $t9          # Load the address of the start of the line into $a0
                            jal printLine         # f(a0) print the data for this line 

                            beq $s7, 1, menu
                            j  cheack_file_IDs


    if_it_unnormal:
    
                  move $a0, $t9          # Load the address of the start of the line into $a0  
                  jal get_next_line
                  j cheack_file_IDs

                                                    
                            
                        
    j menu
#---------------------------------------Check Id is equal to the inputBuffer_ID-------------------------

BoolIDCheck:

# f(a0, inputbuffer ) Return --> in t5 = 1 if the ID is equal to the inputBuffer_ID, 0 otherwise
# a0 for the line .

    move $t8, $ra # save the return address

    move $t7 , $a0 # save the address of the line in t7

    # Search for the test ID in the buffer
  
 # Initialize $t3 with 0 for summing ASCII values of inputBuffer_ID
    li $t3, 0
    la $a0, inputBuffer_ID
    jal calculateSum       # Calculate sum of ASCII values in inputBuffer_ID
    move $t5, $v0          # Move result to $t5



    move $a0, $t7 # restore the address of the line in a0
    # Reset $t3 to 0 for use in comparing with each ID in buffer
    li $t3, 0

findIdInline:

    lb $a1, 0($a0)         # Load the byte at the current buffer position into $a1
    beq $a1, ':', checkIdIfEqual              # If colon, check if ID matches
    addiu $a0, $a0, 1      # Move to the next character in buffer
    addu $t3, $t3, $a1     # Add the ASCII value to the sum for ID comparison
    j findIdInline

checkIdIfEqual:
    beq $t5, $t3, values_equal_OF_IDS # Compare sum of ASCII values
    # If not equal, find the start of the next line
        li $t5, 0
        move $ra, $t8 # restore the return address
        jr $ra


values_equal_OF_IDS :
    # If the ID is equal, return 1
    li $t5, 1
    move $ra, $t8 # restore the return address
    jr $ra



#---------------------------------------End of Check Id is equal to the inputBuffer_ID------------------




#------------------------calculate the sum of the ASCII values in the inputBuffer_ID--------------
calculateSum:
    # Input: $a0 (address of the string)
    # Output: $v0 (sum of ASCII values)
    li $v0, 0              # Initialize sum to 0
sum_loop:
    lb $t1, 0($a0)         # Load the next character
    beq $t1, '\0', end_sum # Check for end of string
    beq $t1, '\n', end_sum # Check for end of string
    addu $v0, $v0, $t1     # Add character's ASCII value to sum
    addiu $a0, $a0, 1      # Move to the next character
    j sum_loop
end_sum:
    jr $ra                 # Return with sum in $v0


#-------------------------------------End of calculate the sum of the ASCII values in the inputBuffer_ID----------------


#print the line of the file

#-----------------------------------function to print the line--------------------------------------------
printLine:

    # f(a0) -> print line also t9 has the address of next line with a0 
    	
    lb $a1, 0($a0)
    beq $a1, '\n', donePrintingLine  # End of data for this line
    beq $a1, '\0', noNextLIne  # End of data for this line
    move $a0, $a1
    li $v0, 11             # syscall for printing character
    syscall
    
    addiu $t9, $t9, 1      # Move to the next character in buffer
    move $a0, $t9          # Load the address of the start of the line into $a0
   
    j printLine            # Continue printing data
    
donePrintingLine:

    move $a0, $a1
   	li $v0, 11             # syscall for printing character
   	syscall
   	
        addiu $t9, $t9, 1      # Move to the next character in buffer
        move $a0, $t9          # Load the address of the start of the line into $a0
        lb $a1, 0($a0)
        beq $a1, '\0', doneFile  # End of data for this line

        jr $ra

doneFile:
    li $s7 , 1 # set the value of s7 to 1 to indicate that the buffer is done.
    jr $ra
    

#-----------------------------------End of function to print the line--------------------------------------------


#-----------------------------------function to get the next line--------------------------------------------      
get_next_line:
    # f(a0) return --> in a0 the start of the next line , s7 = 1 if the buffer is done, 0 otherwise

    lb $a1 , 0($a0) # Load the next character from the buffer into $a1
    beq $a1, '\0', noNextLIne  # End of data for this line
    beq $a1, '\n', done_get_next_line  # End of data for this line
    addiu $a0, $a0, 1      # Move to the next character in buffer
    j get_next_line         # Continue printing data

   done_get_next_line: 
    addiu $a0, $a0, 1      # Move to the next line
    lb $a1 , 0($a0) # Load the next character from the buffer into $a1
    beq $a1, '\0', noNextLIne  # End of data for this line
    jr $ra

    noNextLIne:
    li $s7 , 1 # set the value of s7 to 1 to indicate that the buffer is done.
    jr $ra
    
    

#-----------------------------------End of function to get the next line--------------------------------------------



# Exit program
li $v0, 10 # syscall code for exit
syscall

average_test_value:

	la $t7,buffer 
	la $a1,outputString
	
 
             
             
          

   # choosing the reg s0 to s3 to save the count of each test result
    li $s1, 0 # for count of Hgb
    li $s2, 0 # for count of BGT
    li $s3, 0 # for count of LDL
    li $s4, 0 # for count of BPT

    # Initialize floating-point registers with zero
    la $a0, zero_float     # Load the address of the zero_float constant
    lwc1 $f20, 0($a0)      # Load the floating-point zero into $f20
    lwc1 $f21, 0($a0)      # Load the floating-point zero into $f21
    lwc1 $f22, 0($a0)      # Load the floating-point zero into $f22
    lwc1 $f23, 0($a0)      # Load the floating-point zero into $f23




#-----------------------------------Getting the floating-point values from the file--------------------------------

    la $a0, buffer         # Load address of the start of the buffer into $a0
    la $t7, buffer         # Initialize $t7 with the start of the buffer
    la $a1, outputString   # Load address of the output string into $a1




#line_test_values: 

# this function retrun the float value of the test result in F1 and the type of the test in t4
#and also a0 will be the start of the next line. if there no next line 


#example 
#LDL, 2002-22, 6.0 line 

# F(a0)  Return --> F1 = 6.0 (float point) , t4 = 3 (type of test = LDL) , a0 = start of the next line
# s1 = 0, s2 = 0, s3 = 1, s4 = 0 (count of each test result) in the buffer   
# s7 = 0 means a0 has new line address and the buffer not end , s7 = 1 means the buffer end. and no more lines.

# t4 = 1 means Hgb, t4 = 2 means BGT, t4 = 3 means LDL, t4 = 4 means BPT
# s1 = count of Hgp, s2 = count of BGT, s3 = count of LDL, s4 = count of BPT  ,in the buffer


   get_values_from_line:

            jal line_test_values # Jump to the line_test_values label

            #-----------------------------------sum the values of the test result to calculate the average--------------------------------

            beq $t4, 1, Hgb_test_sum
            beq $t4, 2, BGT_test_sum
            beq $t4, 3, LDL_test_sum
            beq $t4, 4, BPT_test_sum

            Hgb_test_sum:
                        add.s $f20, $f20, $f1 
                         beq $s7, 1, find_the_avg  # if s7 = 1 mean done file reading
                        j get_values_from_line

            BGT_test_sum:
                        add.s $f21, $f21, $f1
                         beq $s7, 1, find_the_avg  # if s7 = 1 mean done file reading
			            j get_values_from_line            


            LDL_test_sum:
                        add.s $f22, $f22, $f1
                         beq $s7, 1, find_the_avg  # if s7 = 1 mean done file reading
                        j get_values_from_line	
                        		
            BPT_test_sum: 
                        add.s $f23, $f23, $f1
                         beq $s7, 1, find_the_avg  # if s7 = 1 mean done file reading
                        j get_values_from_line


#-----------------------------------End of sum the values of the test result to calculate the average--------------------------

find_the_avg:
            # Convert count from integer to floating-point
            mtc1 $s1, $f12  # Convert Hgb count to floating-point
            cvt.s.w $f12, $f12
            mtc1 $s2, $f13  # Convert BGT count to floating-point
            cvt.s.w $f13, $f13
            mtc1 $s3, $f14  # Convert LDL count to floating-point
            cvt.s.w $f14, $f14
            mtc1 $s4, $f15  # Convert BPT count to floating-point
            cvt.s.w $f15, $f15

            # Divide sum by count to find the average
            div.s $f12, $f20, $f12  # Average for Hgb
            div.s $f13, $f21, $f13  # Average for BGT
            div.s $f14, $f22, $f14  # Average for LDL
            div.s $f15, $f23, $f15  # Average for BPT
            
            
                   # Print newline character
   	     li $v0, 11          # System call for printing a character
             li $a0, 10          # Load ASCII value of newline ('\n') into $a0
             syscall 


            # Print each average
            li $v0, 4
            la $a0, messageHgb
            syscall
            
            
            li $v0, 2         # Print float
            mov.s $f12, $f12  # Load average Hgb for printing
            syscall
            
                # Print newline character
   	     li $v0, 11          # System call for printing a character
             li $a0, 10          # Load ASCII value of newline ('\n') into $a0
             syscall 

            li $v0, 4
            la $a0, messageBGT
            syscall
            
            
            li $v0, 2         # Print float
            mov.s $f12, $f13  # Load average BGT for printing
            syscall
            
                  # Print newline character
   	     li $v0, 11          # System call for printing a character
             li $a0, 10          # Load ASCII value of newline ('\n') into $a0
             syscall 


            li $v0, 4
            la $a0, messageLDL
            syscall
            
            
            li $v0, 2         # Print float
            mov.s $f12, $f14  # Load average LDL for printin
            syscall
            
                  # Print newline character
   	     li $v0, 11          # System call for printing a character
             li $a0, 10          # Load ASCII value of newline ('\n') into $a0
             syscall 


            li $v0, 4
            la $a0, messageBPT
            syscall
            
            mov.s $f12, $f15  # Load average BPT for printing
            li $v0, 2         # Print float
            syscall
            
                  # Print newline character
   	     li $v0, 11          # System call for printing a character
             li $a0, 10          # Load ASCII value of newline ('\n') into $a0
             syscall 


            j menu
               

#----------------------------------------------end of get average test value-----------------------------------------------
##############################################             
newLine: 
	addi $s3, $s3, 23

append_loop_Float:
	lb $t0, 0($s3)
	beq $t0, 10, convertTOfloat # Check if byte is newline character
	
	# Check if the byte is null terminator '\0'
	beq $t0, $zero,convertTOfloat # If null terminator found, end parse then to endfile

	sb $t0, 0($s1) # Store byte to resultString
	addi $s3, $s3, 1 # Increment index for buffer
	addi $s1, $s1, 1 # Increment index for output_string
	addi $s2, $s2, 1 # Increment counter for resultString

	
	# Print the content of $t5
	li $v0, 11 # System call for print integer
	move $a0, $t0 # Move the content of $t4 to $a0 for printing
	syscall
	
	# Print newline
	li $v0, 4 # syscall for print_str
	la $a0, newline
	syscall
	
	j append_loop_Float


convertTOfloat:

    # At this point, you should have an ASCII representation of a number in resultString.
    # Reset $s1 and $s2 for the next number
    la $s1, resultString
    li $s2, 0

    
    	# Print result string
	li $v0, 4 # syscall for print_str
	la $a0, resultString
	syscall	
	# j newLine 
    
    	# Print newline
	li $v0, 4 # syscall for print_str
	la $a0, newline
	syscall
	
    la $a0, resultString            # Load address of the string
    jal parseString
    jal convertPartsToFloatAndPrint
    
    
    clear_resultString:
# Load the address of the resultString into a register to clear after each conversion
	la $t0, resultString
	
	li $v0, 4 # syscall for print_str
	la $a0, resultString
	syscall	
      
      # Print newline
	#li $v0, 4 # syscall for print_str
	#la $a0, newline
	#syscall
# Set the number of bytes to clear
	li $t1, 12

	jal clear_loop

	j newLine


    
endFILE:

	#for the last line
    # Print newline
	li $v0, 4 # syscall for print_str
	la $a0, resultString
	syscall	
      
      
      calculateAvg:

       div.s $f5, $f4, $f6   # Divide $f4 by $f6 to get the average, result in $f5

        # Print the message
    li $v0, 4
    la $a0, MSG1
    syscall


    # Print the average float
    mov.s $f12, $f5
    li $v0, 2
    syscall
    
	# Exit program
	li $v0, 10 # syscall code for exit
	syscall


#############################################################################3
update_test:
# Exit program
li $v0, 10 # syscall code for exit
syscall

delete_test:
# Exit program


# Prompt user for medical data
li $v0, 4 # Print string syscall
la $a0, patient_id_prompt
syscall


# Read integer input from user
li $v0, 5 # Read integer syscall
syscall
move $t9, $v0 # Move the input integer to $t9


delete_another_line:

move $t0, $zero # $t0 is now zero
mult $t0, $zero # the result of the multiplication is zero, stored in `lo` and `hi`
mflo $31 # move the result from `lo` to `lo`, this is effectively a reset

# To reset the `t4` register
move $t4, $zero

# Load the address of the buffer into $a3
la $a3, buffer

# Initialize index for storing IDs in the array
li $t0, 0

li $t3, 0x3A # ASCII value for ':
# Load the base address of ids_array into $t5

la $t5, ids_array

# Initialize the flag register (this to make sure if the id stored to go to the next id
li $t7, 0

li $a1, 0


parse_loopp:

#-----------------------------------
#start reading id in each line :
#-----------------------------------

# Load a byte from memory into $a1
lb $a1, 0($a3)
# Check if the byte is null terminator '\0'
beq $a1, $zero, menu # If null terminator found, end parse loop


# Check if flag t7 is set to 1
beq $t7, $zero, continue_parsingg




# Walk in the buffer until "\n" is found
search_newlinee:
# Load a byte from memory into $a1
lb $a1, 0($a3)

# Check if the byte is null terminator '\0'
beq $a1, $zero, menu # If null terminator found, end parse loop


# Check if the byte is newline character '\n'
li $t8, 0x0A # ASCII value for '\n'
beq $a1, $t8, reset_flagg # If newline found, reset flag and continue parsing

# Move to the next byte in the buffer
addi $a3, $a3, 1






j search_newlinee

reset_flagg:
# Reset flag t7
li $t7, 0

# Load a byte from memory into $a1
lb $a1, 0($a3)
# Check if the byte is null terminator '\0'
beq $a1, $zero, menu # If null terminator found, end parse loop

# Continue parsing loop
j parse_loopp

continue_parsingg:
# Load a byte from memory into $a1
lb $a1, 0($a3)

# Check if the byte is a digit or a colon
li $t1, 0x30 # ASCII value for '0'
beq $a1, $t3, store_idd

# Store str
# Store date
# Store result

blt $a1, $t1, next_iterationn

# Convert ASCII digit to integer and add to ID
sub $a1, $a1, $t1 # Convert ASCII to integer
mul $t4, $t4, 10 # Multiply current ID by 10
add $t4, $t4, $a1 # Add new digit to ID

# Move to the next byte in the buffer
addi $a3, $a3, 1

# Repeat the loop
j parse_loopp

next_iterationn:
# Move to the next byte in the buffer
addi $a3, $a3, 1

# Repeat the loop
j parse_loopp



store_idd:


# Each element in the array is 4 bytes (assuming 32-bit integers)
sll $t6, $t0, 2 # Multiply the index by 4 (shift left by 2) to account for each integer being 4 bytes

# Add the offset to the base address of ids_array
add $t5, $t5, $t6 # $t5 now holds the address of ids_array[index]

# Store the value of $t4 into the memory location pointed to by $t5
sw $t4, 0($t5) # Store the value of $t4 as a word at the calculated memory location



#brint the line if the id = user input
beq $t4, $t9, equal_branchh # Branch to equal_branch if $t4 is equal to $t9
# Code to execute if $t4 is not equal to $t9
j next_instructionn # Jump to next_instruction

equal_branchh:

# Save register values onto the stack
subi $sp, $sp, 20 # Adjust stack pointer to make space for 5 registers (5 * 4 bytes = 20 bytes)

sw $a3, 0($sp) # Save $a3
sw $t0, 4($sp) # Save $t0
sw $t3, 8($sp) # Save $t3
sw $t5, 12($sp) # Save $t5
sw $t7, 16($sp) # Save $t7


jal delete_line # Call print_specific_line if $t4 is equal to $t9


# Restore register values from the stack
lw $t7, 16($sp) # Restore $t7
lw $t5, 12($sp) # Restore $t5
lw $t3, 8($sp) # Restore $t3
lw $t0, 4($sp) # Restore $t0
lw $a3, 0($sp) # Restore $a3

addi $sp, $sp, 20 # Restore stack pointer

next_instructionn:

# Reset $t4 for next ID
li $t4, 0


# Continue with the next instruction

#jal print_specific_line

# Increment loop counter
addi $t0, $t0, 1


# Move to the next byte in the buffer
addi $a3, $a3, 1

# Load a byte from memory into $a1
lb $a1, 0($a3)

# Set flag to indicate an ID has been found
li $t7, 1


# Continue parsing loop
j parse_loopp



j menu #to go to choice 2 minu again

 

invalid_choicee:
# Invalid choice message
li $v0, 4
la $a0, invalid_choice_msg
syscall
j delete_test








delete_line:


# Initialize registers
la $s0, buffer # Load address of buffer into $s0
la $s1, new_buffer # Load address of new_buffer into $s1
la $t1, newline # Load address of newline string
lb $t1, 0($t1) # Load byte (newline character) into $t1
li $t2, 0 # Initialize counter $t2 to 0 to count \n

copy_loop:
beq $t0 , $zero , skip_line # this to delete the first line and continue copying others
end_skip_line:
continue_copying:
lb $k0, 0($s0) # Load byte from buffer into $t0
beq $k0, $zero, end_copy # If byte is '\0', exit loop
# Check if the byte is '\n'


sb $k0, 0($s1) # Store byte from $t0 to new_buffer
addi $s0, $s0, 1 # Move to next byte in buffer
addi $s1, $s1, 1 # Move to next byte in new_buffer
beq $k0, $t1, increment_counter # If byte is '\n', increment counter

j continue_copying # Repeat loop

#if t0 = 0 (first line) skep until first \n
skip_line:

lb $k0, 0($s0) # Load byte from buffer into $t0
beq $k0, $zero, end_copy # If byte is '\0', exit function
addi $s0, $s0, 1 # Move to next byte in buffer
# If byte is '\n', exit function
beq $k0, $t1, end_skip_line
# If not '\n', continue skipping characters

j skip_line # Repeat loop


increment_counter:
addi $t2, $t2, 1 # Increment counter

beq $t0 , $t2 , skip_line # this for check the line number according t0 \n (t2) value
# if t0 = 1 then skip second line
# if t0 = 2 then skip thir line
j continue_copying # Repeat loop


end_copy:
# End of program

# clear_buffer
# Load the address of the buffer into a register
la $t0, buffer

# Set the number of bytes to clear
li $t1, 2000

jal clear_loop





#copy new_buffer to the buffer
# Initialize registers
la $s0, new_buffer # Load address of new_buffer into $s0
la $s1, buffer # Load address of buffer into $s1

copy_loop_2:
lb $t0, 0($s0) # Load byte from new_buffer into $t0
beq $t0, $zero, end_copy_loop # If byte is '\0', exit loop
sb $t0, 0($s1) # Store byte from $t0 to buffer
addi $s0, $s0, 1 # Move to next byte in new_buffer
addi $s1, $s1, 1 # Move to next byte in buffer
j copy_loop_2 # Repeat loop

end_copy_loop:
# End of copying




# Open the output file for writing
li $v0, 13 # syscall code for open
la $a0, filename # load address of file name
li $a1, 1 # open mode: write-only
li $a2, 0 # file permissions (not used in MARS)
syscall # open file

move $s0, $v0 # save file descriptor

# Calculate the length of buffer
li $t3, 0 # Initialize counter for length
la $t4, buffer # Load address of new_buffer

count_length:
lb $t5, 0($t4) # Load byte from new_buffer
beq $t5, $zero, end_count_length # If byte is '\0', exit loop
addi $t3, $t3, 1 # Increment counter
addi $t4, $t4, 1 # Move to next byte in new_buffer
j count_length # Repeat loop

end_count_length:

# Write the contents of new_buffer to the output file
li $v0, 15 # syscall code for write
move $a0, $s0 # file descriptor
la $a1, buffer # load address of new_buffer
move $a2, $t3 # length of new_buffer
syscall # write to file

# Close the output file
li $v0, 16 # syscall code for close
move $a0, $s0 # file descriptor
syscall # close file

 

# clear_buffer
# Load the address of the buffer into a register
la $t0, new_buffer

# Set the number of bytes to clear
li $t1, 2000

jal clear_loop


# Print the contents of the new buffer
la $a0, new_buffer # Load address of new buffer
li $v0, 4 # System call for print string
syscall


# Print newline
li $v0, 4 # syscall for print_str
la $a0, newline
syscall

# Print the contents of the new buffer
la $a0, buffer # Load address of new buffer
li $v0, 4 # System call for print string
syscall


j delete_another_line

###############################################################################################################################
#function area 

#-------------------------Function Return float in F1 also type of Test name for eachline as parameter in a0---------


#line_test_values: 

# this function retrun the float value of the test result in F1 and the type of the test in t4
#and also a0 will be the start of the next line. if there no next line 


#example 
# 1201139: LDL, 2002-22, 6.0 line 

# F(a0)  Return --> F1 = 6.0 (float point) , t4 = 3 (type of test = LDL) , a0 = start of the next line
# s1 = 0, s2 = 0, s3 = 1, s4 = 0 (count of each test result) in the buffer   
# s7 = 0 means a0 has new line address and the buffer not end , s7 = 1 means the buffer end. and no more lines.

# t4 = 1 means Hgb, t4 = 2 means BGT, t4 = 3 means LDL, t4 = 4 means BPT
# s1 = count of Hgp, s2 = count of BGT, s3 = count of LDL, s4 = count of BPT  ,in the buffer

line_test_values:

    la $a1, outputString   # Load address of the output string of testResult(string) into $a1  
    
    # .data section : outputString: .space 50  # Allocate space for the output string

    li $t2, 0 # rest the value of asscii sum.

    move $t8, $ra # save the return address


find_semicolon:

    lb $t0, 0($a0)        # Load the next character from the input string into $t0
    beq $t0, ':', determine_test_name # If colon, check if ID matches
    li $t1, ','           # Load the ASCII value of semicolon into $t1
    beq $t0, $t1, increment_counterr # If the current character is a semicolon, increment the counter
    addiu $a0, $a0, 1     # Move to the next character in the input string
    j find_semicolon      # Jump back to the start of the loop

increment_counterr:
    addiu $t2, $t2, 1     # Increment the semicolon counter
    addiu $a0, $a0, 1     # Move past the semicolon
    li $t3, 2             # We're looking for the second semicolon
    beq $t2, $t3, start_copying # If we've found two semicolons, start copying
    j find_semicolon      # Otherwise, keep looking for semicolons

start_copying:

    lb $t0, 0($a0)        # Load the next character from the input string into $t0
    beq $t0, ' ', skipSpace # Check for the space character
    beq $t0, '\n', ReturnValues # Check for the end of the line

    sb $t0, 0($a1)        # Store the character in the output string
    addiu $a0, $a0, 1     # Move to the next character in the input string
    addiu $a1, $a1, 1     # Move to the next position in the output string
    j start_copying       # Jump back to the start of the copy loop

skipSpace:
    addiu $a0, $a0, 1     # Move to the next character in the input string
   j start_copying



# -----------------------------------Get return uniqe value in t4 according to the test name-------------------------------- 


 determine_test_name: 
  li $t3, 0 # rest the value of asscii sum. 

 GetUniqeValueOfTestName:

  addiu $a0, $a0, 1      # Skip the : character
  lb $t0, 0($a0)        # Load the next character from the input string into $t0
  beq $t0, ' ', GetUniqeValueOfTestName # Check for the end of the string
  
  # sum the ascii values of the test name to choose the test value to calculate the average
    beq $t0, ',', get_type_of_test # If colon, have unique value for each test name 
    addu $t3, $t3, $t0     # Add the ASCII value to the sum for test name comparison
    
    jal GetUniqeValueOfTestName

get_type_of_test:

    addiu $t2, $t2, 1     # Increment the semicolon counter

     # Check the sum of the ASCII values to determine the test name

    li $t1, 0x111        # ASCII sum for "Hgb"
    beq $t3, $t1, Hgb_test # If the sum matches "Hgb", jump to Hgb_test

    li $t1, 0xDD         #  ASCII sum for "BGT"
    beq $t3, $t1, BGT_test # If the sum matches "BGT", jump to BGT_test

    li $t1, 0xDC        #  ASCII sum for "LDL"
    beq $t3, $t1, LDL_test # If the sum matches "LDL", jump to LDL_test

    li $t1, 0xE6         #  ASCII sum for "BPT"
    beq $t3, $t1, BPT_test # If the sum matches "BPT", jump to BPT_test

#return unique value for each test name

    Hgb_test:
        li $t4, 1
        addiu $s1, $s1, 1
        addiu $a0, $a0, 1 # skip comma 
        j find_semicolon

    BGT_test:
        li $t4, 2
        addiu $s2, $s2, 1
        addiu $a0, $a0, 1 
        j find_semicolon

    LDL_test:
        li $t4, 3
        addiu $s3, $s3, 1
        addiu $a0, $a0, 1
        j find_semicolon

    BPT_test:
        li $t4, 4
        addiu $s4, $s4, 1
        addiu $a0, $a0, 1
        j find_semicolon    

#-----------------------------------end of Get return uniqe value in t4 according to the test name------------------------


ReturnValues:

            move $t7, $a0          # save the start of the next line
            sb $t0, 0($a1)        # Store \n in the output string for use it for termination




	
	#loop to check outupt string if it has dot or not

          la $a0, outputString
          check_dot:
                    lb $t0, 0($a0)        # Load the next character from the output string into $t0
                    beq $t0, '.', dot_found # If dot, jump to dot_found
                    beq $t0, '\n', no_dot_found # If newline, jump to no_dot_found
                    addiu $a0, $a0, 1      # Move to the next character in the output string
                    j check_dot            # Jump back to the start of the loop

          no_dot_found:
                    li $t1, 0x2E          # ASCII value of '.'
                    sb $t1, 0($a0)        # Add a decimal point to the end of the output string
                    addiu $a0, $a0, 1     # Move to the next position in the output string
                    # add zero value after the decimal point
                    li $t1, 0x30          # ASCII value of '0'
                    sb $t1, 0($a0)        # Add a zero after the decimal point
                    addiu $a0, $a0, 1     # Move to the next position in the output string
                    # add \n value after the decimal point
                    li $t1, 0x0A          # ASCII value of '\n'
                    sb $t1, 0($a0)        # Add a newline character after the decimal point
                   

           dot_found:  # don't do anything
           
           
           
           
            beq $t4, 1, Hgb_test_type
            beq $t4, 2, BGT_test_type
            beq $t4, 3, LDL_test_type
            beq $t4, 4, BPT_test_type

            Hgb_test_type:
                        la $a0, outputString   # Load address of the output string into $a0
                        jal parseString        # Jump to the string parsing function
                        jal convertPartsToFloatAndPrint
                        # f1 will have the float value of the test result
                        j doneConvertion


            BGT_test_type:
                        la $a0, outputString   # Load address of the output string into $a0
                        jal parseString        # Jump to the string parsing function
                        jal convertPartsToFloatAndPrint
                        # f1 will have the float value of the test result
			            j doneConvertion            


            LDL_test_type:
                        la $a0, outputString   # Load address of the output string into $a0
                        jal parseString        # Jump to the string parsing function
                        jal convertPartsToFloatAndPrint
                        # f1 will have the float value of the test result
                        j doneConvertion	
                        		
            BPT_test_type: 
                        la $a0, outputString   # Load address of the output string into $a0
                        jal parseString        # Jump to the string parsing function
                        jal convertPartsToFloatAndPrint
                        # f1 will have the float value of the test result


doneConvertion:

                move $ra, $t8 # restore the return address
                addiu $t7, $t7, 1 # Move to the next line 
                move $a0, $t7    # Move to the next line stored in a0 as return value
                li $t2, 0              # Reset the sum for next ID
                lb $a1, 0($a0)
                beq $a1, '\0', buffer_done # Check for end of buffer
                li $s7, 0 # set the value of s6 to 0 to indicate that the buffer is not done.
                jr $ra

                buffer_done:
                li $s7, 1 # set the value of s6 to 1 to indicate that the buffer is done
                jr $ra
               


#-------------------------------------string to float conversion --------------------------------------------

parseString:
    # Initialize variables
    li $t1, 0              # Will hold the integer part
    li $t2, 0              # Will hold the fractional part
    li $t3, 1              # Will be used for the scale
    
    # Parse the integer part
parseInteger:
    lb $t0, 0($a0)         # Load the next byte (character) from the string
    beq $t0, '.', endInteger # Check for decimal point    
    sub $t0, $t0, '0'      # Convert from ASCII to integer
    mul $t1, $t1, 10       # Multiply current result by 10
    add $t1, $t1, $t0      # Add the new digit
    
    addiu $a0, $a0, 1      # Move to the next character
    j parseInteger         # Loop back

endInteger:
    sw $t1, integerPart    # Store the integer part
    addiu $a0, $a0, 1      # Move past the decimal point

    # Parse the fractional part
parseFractional:
    lb $t0, 0($a0)         # Load the next byte (character)
    beq $t0, '\n', endFractional # Check for null terminator
    
    sub $t0, $t0, '0'      # Convert from ASCII to integer
    mul $t2, $t2, 10       # Multiply current result by 10
    add $t2, $t2, $t0      # Add the new digit
    
    mul $t3, $t3, 10       # Increase scale
    addiu $a0, $a0, 1      # Move to the next character
    j parseFractional      # Loop back

endFractional:
    sw $t2, fractionalPart # Store the fractional part
    sw $t3, scale          # Store the scale
    jr $ra                 # Return

# Function to convert the parts to floating point and print
convertPartsToFloatAndPrint:
    # Load and convert integer part
    lw $s0, integerPart
    mtc1 $s0, $f1
    cvt.s.w $f1, $f1

    # Load and convert fractional part
    lw $s0, fractionalPart
    mtc1 $s0, $f2
    cvt.s.w $f2, $f2

    # Load and convert scale
    lw $s0, scale
    mtc1 $s0, $f3
    cvt.s.w $f3, $f3

    # Divide fractional part by scale
    div.s $f2, $f2, $f3

    # Combine integer and fractional parts
    add.s $f1, $f1, $f2
    
    jr $ra                 # Return
	
#---------------------------------------End of string to float conversion--------------------------------------------

#---------------------------------------End of Function which returns the type of the test--------------

SearchUnNORMAL:


search_unnormal_tests:

  # Prompt user for the test ID
    li $v0, 4
    la $a0, inputPrompt
    syscall

    # Read the test ID as a string
    li $v0, 8
    la $a0, inputBuffer_ID
    li $a1, 20
    syscall


li $s7, 0 # Initialize the flag to 0
la $a0, buffer # Load the address of the buffer into $a0


cheack_file_IDs_unnormal:

    move $t9, $a0 # Save the address of the start of the buffer in $t7

    jal BoolIDCheck # f(a0 , inputbuffer_ID) retrun 1 in t5 if the ID is equal to the inputBuffer_ID

    #if the t5 = 1 mean the ID is equal to the inputBuffer_ID
    #else the ID is not equal to the inputBuffer_ID

    beq $t5, 1, check_test_resultUnnormal
    jal get_next_line
    beq $s7, 1, menu
    j cheack_file_IDs_unnormal



  
    # Logic for printing the data after ID match

    #normal range for each test
    #1. Hemoglobin (Hgb): 13.8 to 17.2 grams per deciliter 
    #2. Blood Glucose Test (BGT): Normal Range Between 70 to 99 milligrams per deciliter (mg/dL) 
    #3. LDL Cholesterol Low-Density Lipoprotein (LDL): Normal Range Less than 100 mg/dL
    #4. Blood Pressure Test (BPT): Normal Range: Systolic Blood Pressure: Less than 120 millimeters of 
    #   mercury (mm Hg). Diastolic Blood Pressure: Less than 80 mm Hg 

check_test_resultUnnormal: 

            move $a0, $t9          # Load the address of the start of the line into $a0
            jal line_test_values # f(a0) retrun F1 = test result in floating point, t4 = type of test, a0 = start of the next line

            #-----------------------------------sum the values of the test result to calculate the average--------------------------------
            
            beq $t4, 1, Hgb_test_unnormal
            beq $t4, 2, BGT_test_unnormal
            beq $t4, 3, LDL_test_unnormal
            beq $t4, 4, BPT_test_unnormal


            Hgb_test_unnormal:
            
                            lwc1 $f3, lowerBoundHgb # Load the lower bound value, which is 13.8
                            lwc1 $f4, upperBoundHgb # Load the upper bound value, which is 17.2

                            c.lt.s $f1, $f3         # Compare the test result in $f1 with the lower bound $f3
                            bc1t printIfUnnormal   # If the test result is less than the lower bound, branch to if_it_unnormal

                            c.le.s $f4, $f1         # Compare the test result in $f1 with the upper bound $f4
                            bc1t printIfUnnormal   # If the test result is greater than the upper bound, branch to if_it_unnormal


                            move $a0, $t9           # Load the address of the start of the line into $a0
                            jal printLine             # Jump to printLine to print the data for this line
                            
                            beq $s7, 1, menu  # If the end of the file is reached, return to the menu
                            j cheack_file_IDs_unnormal       # Continue to check file IDs							
                                                        
                                    
                    
            BGT_test_unnormal:

                           lwc1 $f3, lowerBoundBGT # Load the lower bound value is 70.0
                           lwc1 $f4, upperBoundBGT # Load the upper bound value is 99.0

                           c.lt.s $f1, $f3         # Compare the test result in $f1 with the lower bound $f3
                           bc1t printIfUnnormal   # If the test result is less than the lower bound, branch to if_it_unnormal

                           c.le.s $f4, $f1         # Compare the test result in $f1 with the upper bound $f4
                           bc1t printIfUnnormal   # If the test result is greater than the upper bound, branch to if_it_unnormal
                           

                           beq $s7, 1, menu
                           j  cheack_file_IDs_unnormal                                        

            LDL_test_unnormal:

 
                            lwc1 $f4, upperBoundLDL  # Load the upper bound value of 100.0 into $f3
                            c.le.s $f4, $f1          # Compare the test result in $f1 with the upper bound in $f3
                            bc1t printIfUnnormal    # If $f1 is not less than or equal to $f3 (i.e., $f1 is greater than $f3), branch to end_findNextLine
                           
                            beq $s7, 1, menu
                            j  cheack_file_IDs_unnormal         
                        		
            BPT_test_unnormal: 

                            lwc1 $f4, upperBoundSystolicBPT # Load the upper bound value is 120.0
                            lwc1 $f3, upperBoundDiastolicBPT # Load the upper bound value is 80.0

                            c.lt.s $f1, $f3         # Compare the test result in $f1 with the lower bound $f3
                            bc1t printIfUnnormal   # If the test result is less than the lower bound, branch to if_it_unnormal

                            c.le.s $f4, $f1         # Compare the test result in $f1 with the upper bound $f4
                            bc1t printIfUnnormal   # If the test result is greater than the upper bound, branch to if_it_unnormal


                            beq $s7, 1, menu
                            j  cheack_file_IDs_unnormal



              printIfUnnormal:
                  
                            move $a0, $t9           # Load the address of the start of the line into $a0
                            jal printLine             # Jump to printLine to print the data for this line
                            
                            beq $s7, 1, menu  # If the end of the file is reached, return to the menu
                            j cheack_file_IDs_unnormal       # Continue to check file IDs			

                                    


    j menu















###########################################33333#######


end_programm:
# Exit program
li $v0, 10 # syscall code for exit
syscall

 
 
 
