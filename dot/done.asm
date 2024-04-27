   .data
dashes_prompt: .asciiz "\n______________________________________________\n"  
welcome_prompt: .asciiz "Welcome to Medical Test Management System"      
file_path_prompt: .asciiz "\nEnter your file path:\n "
filename: .space 256    # Allocate space for file path
file_not_found_msg: .asciiz "File not found or path incorrect. Please try again.\n"
file_contents: .asciiz "\nMedical file contents:\n"
not_valid_id_msg: .asciiz "\nThe ID is not valid. Please try with a valid ID.\n"
not_valid_id_date_msg: .asciiz "\nThere is no record matching your input. Please make sure about your inputs.\n"
invalid_input_msg: .asciiz "\nInvalid input. Please enter 'c' or 'm'!!.\n"
result_prompt_numeric: .asciiz "Enter result (numeric digits or dot only): "


buffer:   .space 2000   # Buffer to store file contents
new_buffer:   .space 2000   # Buffer to store file contents


test_name_from_file: .space 4 #this to store the test name from the file
test_name_chosen_by_user: .space 4 #this to store the test name from the file
prompt: .asciiz "\nChoose a test type:\n1. Hemoglobin (Hgb)\n2. Blood Glucose Test (BGT)\n3. LDL Cholesterol (LDL)\n4. Blood Pressure Test (BPT)\nEnter your choice (1-4):\n"
invalid_choice_msg_for_test_type: .asciiz "\nInvalid choice. Please enter a valid option from (1-4).\n"
successed_test_type: .asciiz "\nThe test type saved correctly as:\n"
new_test_result: .space 15   # Allocate 7 bytes for the new test result
diastolic_prompt: .asciiz "\nEnter the diastolic blood pressure: "
systolic_prompt: .asciiz "\nEnter the systolic blood pressure: "
diastolic_result: .space 7   # Allocate 7 bytes for the Diastolic result
systolic_result: .space 7   # Allocate 7 bytes for the Systolic result

# Prompt for user input to continue or return to menu after no record is found
no_record_message: .asciiz "\nThere is no record matching your input. Please make sure about your inputs.\nWould you like to continue or return to the menu?\n"

# Prompt for user input to continue or return to menu after successful update
updated_success_message: .asciiz "\n\nResult updated successfully.\nWould you like to continue or return to menu?\n"

prompt_before: .asciiz "\nTest before update:\n "   # Prompt before update
prompt_after:  .asciiz "\nTest after update:\n"    # Prompt after update
# Prompt for user input to continue or exit after successful update
continue_or_exit_menu: .asciiz "Enter 'c' to continue or 'm' to exit: "

# Prompt for user input to continue or return to menu after no record is found
continue_or_return_menu: .asciiz "Enter 'c' to continue or 'm' to return to the menu: "
# Prompt for invalid user input
invalid_input_message: .asciiz "\nInvalid input. Please enter 'c' to continue, 'm' to return to the menu:\n "

# Prompt for user input to continue or return to menu after successful update
delete_success_message: .asciiz "\n\nThe test deleted successfully.\nWould you like to continue or return to menu?\n"


# successful addition
add_success_message: .asciiz "\n\nThe test added successfully."

#file contents before addition
before_add_success_message: .asciiz "The file contents before addition."

#file contents after addition
after_add_success_message: .asciiz "The file contents after addition."

#file contents before deletion
before_delete_success_message: .asciiz "The file contents before deletion."

#file contents after deletion
after_delete_success_message: .asciiz "The file contents after deletion."





eqmsg:      .asciiz     "Strings are equal\n"
nemsg:      .asciiz     "Strings are not equal\n"

# Padding to align ids_array properly
        .align 3
ids_array: .space 1000      # Array to store integer IDs

menu_prompt: .asciiz "\n\nMedical Test System Menu\n1. Add a new medical test\n2. Search for a test by patient ID\n3. Searching for unnormal tests\n4. Average test value\n5. Update an existing test result\n6. Delete a test\n7. Exit programm\nEnter your choice (1-7): \n"

invalid_choice_msg: .asciiz "\nInvalid choice. Please enter a number between 1 and 7.\n"

patient_id_prompt: .asciiz "\nEnter patient ID, make sure the id is contains 7 integer digits :\n"
invalid_patient_id_msg: .asciiz "\nPlease enter a valid 7-digit numeric patient ID.\n"
invalid_patient_year_msg: .asciiz "\nPlease enter a valid 4-digit numeric year.\n"
invalid_patient_month_msg: .asciiz "\nPlease enter a valid 2-digit numeric month between (1 -12).\n"
patient_id: .space 20
test_value_prompt: .asciiz "\nEnter test name: "

year_prompt: .asciiz "\nEnter year (as 4 digits yyyy):"
month_prompt: .asciiz "\nEnter month (as 2 digits mm): "
first_date_prompt: .asciiz "\nEnter the first date (YYYY-MM)"
second_date_prompt: .asciiz "\nEnter the second date (YYYY-MM)"


result_prompt: .asciiz "\nEnter test result : "


test_name: .space 20
year_buffer: .space 7  #  maximum length of year is 4 digits plus null terminator
month_buffer: .space 7 #  maximum length of month is 2 digits plus null terminator

test_result: .space 15    # Buffer to store the date string
test_BPT: .asciiz "BPT"
 
 
second_menu_options: .asciiz "\nSecond Menu Options:\n1. Retrieve all patient tests\n2. Retrieve all abnormal patient tests\n3. Retrieve all patient tests in a specific period\n4. Return to main menu\n"
second_menu_prompt: .asciiz "\nEnter your choice (1-4): "


update_test_prompt: .asciiz "\nEnter the new test result: "



search_period_prompt: .asciiz "\nEnter the start and end period (e.g., 202203 202204): "

newline: .asciiz "\n"  # new line

colon_space: .asciiz ": "

comma_space: .asciiz ", "

# Buffer to hold the concatenated string
output_string: .space 256  # Adjust the size as needed
outputStringg: .space 256  # Adjust the size as needed #second output string

#################################################################################################3
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
second_outputString: .space 50 #to save the second reading of BPT result

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
    
    IDenteringPrompt: .asciiz "\nEnter the Patient ID'): "  
    enteredID: .space 11  # Buffer FOR ENTERED ID
    error_msg: .asciiz "Failed to open the file.\n"
    


    user_test_new_value: .word 0



    found_unnormal_test: .asciiz "The unnormal test is found successfully.\n"
    not_found_recorde: .asciiz "The test recorde is not found in the file.\n Please try again.\n"
    bool_found: .word 0
    outputString2: .space 50


    
#end of normal and unnormal test ---------------------



        .text
        .globl main

main:


# Display dashes prompt 
    li $v0, 4                   # syscall code for print_string
    la $a0, dashes_prompt        # load address of the prompt string
    syscall
	
# Display welcome prompt for user 
    li $v0, 4                   # syscall code for print_string
    la $a0, welcome_prompt        # load address of the prompt string
    syscall
   
# Display dashes prompt 
    li $v0, 4                   # syscall code for print_string
    la $a0, dashes_prompt        # load address of the prompt string
    syscall
    
# Display prompt for enter file_path
    li $v0, 4                   # syscall code for print_string
    la $a0, file_path_prompt        # load address of the prompt string
    syscall
	
# Read file path from user
file_path_input:
    li $v0, 8                   # syscall code for read_string
    la $a0, filename           # load address of the file_path buffer
    li $a1, 256                 # maximum number of characters to read
    syscall
    
#replace  \n  at the last of file path input with \0
     li $t0, 0                   # counter
replace_newline:
    lb $t1, filename($t0)      # load a character from file_path
    beqz $t1, end_replace       # if null character, exit loop
    beq $t1, 10, replace        # if newline character, replace
    addi $t0, $t0, 1            # increment counter
    j replace_newline
replace:
    li $t2, 0x0                 # load null character
    sb $t2, filename($t0)      # store null character
end_replace:

# File path is now stored in filename

     # Call readtestFile function  
     # if the file read correctly :
     jal readtestFile      # Call the  function
     li $t0, 0
     j file_readed_succesfully  # continue with the  program
     
     # else the file read correctly :
     
file_open_failed:
    
    # Display dashes prompt 
    li $v0, 4                   # syscall code for print_string
    la $a0, file_not_found_msg       # load address of the prompt string
    syscall
    
    j file_path_input #write another valid 

file_readed_succesfully:


 

 
  # Display menu
    menu:
        li $v0, 4
        la $a0, menu_prompt
        syscall
        
enter_valid_choice:
        # Read user choice

    li $v0, 12          # syscall code for reading character
    syscall


        # Branch based on user choice
        beq $v0, 49, add_test
        beq $v0, 50, search_test_by_id
        beq $v0, 51, search_unnormal_tests_by_input_test
        beq $v0, 52, average_test_value
        beq $v0, 53, update_test
        beq $v0, 54, delete_test
        beq $v0, 55,end_programm

        # Invalid choice
        li $v0, 4
        la $a0, invalid_choice_msg
        syscall

        # Return to menu
        j enter_valid_choice   #it was jum to menu and display minu in each unvalid choice !!!!



    
    

        
 # Function To read and print file contents: readtestFile
readtestFile:
        # Open the file
        li $v0, 13              # syscall code for open file
        la $a0, filename        # load address of filename
        li $a1, 0               # open for read-only
        syscall
        move $s0, $v0           # store file descriptor
        
        
        # Check if file opened successfully
        blt $v0, $zero, file_open_failed # branch if $v0 < 0 (file failed to open)




        # Read from the file
read_loop:
        li $v0, 14              # syscall code for read file
        move $a0, $s0           # file descriptor
        la $a1, buffer          # load address of buffer
        li $a2, 2000             # maximum number of bytes to read
        syscall
        

        # Check if end of file
        beq $v0, 0, end_read    # exit loop if end of file
        
       
	 # Display dashes prompt 
    li $v0, 4                   # syscall code for print_string
    la $a0, file_contents       # load address of the prompt string
    syscall
    
        # Print the contents read
        li $v0, 4               # syscall code for print_string
        move $a0, $a1           # load address of buffer
        syscall

        j read_loop             # repeat read loop

end_read:
        # Close the file
        li $v0, 16              # syscall code for close file
        move $a0, $s0           # file descriptor
        syscall
        
        jr $ra                  # return from the function
        
 
# part 1 ) Add a new medical test: the system will allow the user to store a new medical test with the
#required data. The system will check the validity of the input data   
   
#____________________________________   
             add_test:
#____________________________________ 
  

# 1) enter patient id

# ask user to enter patient id

	li $v0, 4            # Print string syscall
	la $a0, patient_id_prompt
	syscall
	jal validate_id


# Append patient ID to output_string
	move $s0, $zero       # Initialize index for output_string
	la $s1, output_string # Load address of output_string


# Append a newline character at the beginning of output_string
	la $s3, output_string   # Load address of output_string
	li $t0, '\n'            # Load newline character
	sb $t0, 0($s3)          # Store newline character at the beginning of output_string
	addi $s2, $s2, 1        # Increment string length counter
	addi $s1, $s1, 1           # Increment index for output_string

 
	li $t0 ,0
append_loop_id:
	lb $t0, patient_id($s0)    # Load byte from patient_id
	beq $t0, 10, end_append_id # Check if byte is newline character
	sb $t0, 0($s1)             # Store byte to output_string
	addi $s0, $s0, 1           # Increment index for patient_id
	addi $s1, $s1, 1           # Increment index for output_string
	j append_loop_id

end_append_id:

# Append ": " after patient ID
	li $t0, ':'              # Load colon character
	sb $t0, 0($s1)           # Store colon character to output_string
	addi $s1, $s1, 1         # Increment index for output_string
	li $t0, ' '              # Load space character
	sb $t0, 0($s1)           # Store space character to output_string
	addi $s1, $s1, 1         # Increment index for output_string


# 2) choose patient test name

# ask user to enter patient id

 # Display the menu prompt
    li $v0, 4          # syscall code for print_string
    la $a0, prompt     # load address of prompt string
    syscall            # print the prompt
    
   
 enter_valid_optionn:
    # Get user input
     li $v0, 12          # syscall code for reading character
    syscall

    la $t0, test_name
    # Check the user's choice and store the corresponding test name
    beq $v0, 49, choice_n1 # If the choice is 1, jump to choice_1
    beq $v0, 50, choice_n2 # If the choice is 2, jump to choice_2
    beq $v0, 51, choice_n3 # If the choice is 3, jump to choice_3
    beq $v0, 52, choice_n4 # If the choice is 4, jump to choice_4
    j invalid_choiceeee     # Otherwise, jump to invalid_choice

choice_n1:
    

   # Store "Hemoglobin (Hgb)" into test_name_chosen_by_user
    li $t5, 'H'          # Load the ASCII value of 'H' into $t5
    sb $t5, 0($t0)       # Store 'H' into the memory location pointed by $t
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'g'          # Load the ASCII value of 'g' into $t5
    sb $t5, 0($t0)       # Store 'g' into the memory location pointed by $t0
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'b'          # Load the ASCII value of 'b' into $t5
    sb $t5, 0($t0)       # Store 'b' into the memory location pointed by $t0
    
 
    j test_name_chosen        # Jump to end_program to terminate the program
      

choice_n2:
    # Store "Blood Glucose Test (BGT)" into test_name_chosen_by_user

    li $t5, 'B'          # Load the ASCII value of 'H' into $t5
    sb $t5, 0($t0)       # Store 'H' into the memory location pointed by $t
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'G'          # Load the ASCII value of 'g' into $t5
    sb $t5, 0($t0)       # Store 'g' into the memory location pointed by $t0
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'T'          # Load the ASCII value of 'b' into $t5
    sb $t5, 0($t0)       # Store 'b' into the memory location pointed by $t0
    
  
    j test_name_chosen        # Jump to end_program to terminate the program

choice_n3:
    # Store "LDL Cholesterol (LDL)" into test_name_chosen_by_user
     # Store "Hemoglobin (Hgb)" into test_name_chosen_by_user
    li $t5, 'L'          # Load the ASCII value of 'H' into $t5
    sb $t5, 0($t0)       # Store 'H' into the memory location pointed by $t
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'D'          # Load the ASCII value of 'g' into $t5
    sb $t5, 0($t0)       # Store 'g' into the memory location pointed by $t0
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'L'          # Load the ASCII value of 'b' into $t5
    sb $t5, 0($t0)       # Store 'b' into the memory location pointed by $t0
    

    j test_name_chosen          # Jump to end_program to terminate the program

choice_n4:
    # Store "Blood Pressure Test (BPT)" into test_name_chosen_by_user
    # Store "Hemoglobin (Hgb)" into test_name_chosen_by_user
    li $t5, 'B'          # Load the ASCII value of 'H' into $t5
    sb $t5, 0($t0)       # Store 'H' into the memory location pointed by $t
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'P'          # Load the ASCII value of 'g' into $t5
    sb $t5, 0($t0)       # Store 'g' into the memory location pointed by $t0
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'T'          # Load the ASCII value of 'b' into $t5
    sb $t5, 0($t0)       # Store 'b' into the memory location pointed by $t0
      
    j test_name_chosen        # Jump to end_program to terminate the program
    
    
    
    invalid_choiceeee:
    # Display an error message for invalid choice
    li $v0, 4          # syscall code for print_string
    la $a0, invalid_choice_msg_for_test_type # load address of invalid_choice_msg string
    syscall            # print the error message
    j enter_valid_optionn             # Go back to the main menu

test_name_chosen :


# Append test name to output_string
move $s0, $zero       # Reset index for test_name
append_loop_test_name:
    lb $t0, test_name($s0)     # Load byte from test_name
    beq $t0, 0 , end_append_test_name # Check if byte is newline character

    sb $t0, 0($s1)             # Store byte to output_string
    addi $s0, $s0, 1           # Increment index for test_name
    addi $s1, $s1, 1           # Increment index for output_string
    j append_loop_test_name

end_append_test_name:

# Append ", " after test name
li $t0, ','              # Load comma character
sb $t0, 0($s1)           # Store comma character to output_string
addi $s1, $s1, 1         # Increment index for output_string
li $t0, ' '              # Load space character
sb $t0, 0($s1)           # Store space character to output_string
addi $s1, $s1, 1         # Increment index for output_string


# 3) enter date year



jal validate_year


li $t0 ,0
# Append year to output_string
move $s0, $zero       # Reset index for year_buffer

append_loop_year:
    lb $t0, year_buffer($s0)   # Load byte from year_buffer
    beq $t0, 10, end_append_year # Check if byte is newline character

    sb $t0, 0($s1)             # Store byte to output_string
    addi $s0, $s0, 1           # Increment index for year_buffer
    addi $s1, $s1, 1           # Increment index for output_string
    j append_loop_year

end_append_year:

# Append "-" after year
li $t0, '-'              # Load dash character
sb $t0, 0($s1)           # Store dash character to output_string
addi $s1, $s1, 1         # Increment index for output_string

# 4) enter date month

# ask user to enter month



jal validate_month

# Append month to output_string
move $s0, $zero       # Reset index for month_buffer
li $t0 ,0
append_loop_month:
    lb $t0, month_buffer($s0)   # Load byte from month_buffer
    beq $t0, 10, end_append_month # Check if byte is newline character

    sb $t0, 0($s1)             # Store byte to output_string
    addi $s0, $s0, 1           # Increment index for month_buffer
    addi $s1, $s1, 1           # Increment index for output_string
    j append_loop_month

end_append_month:

# Append ", " after month
li $t0, ','              # Load comma character
sb $t0, 0($s1)           # Store comma character to output_string
addi $s1, $s1, 1         # Increment index for output_string
li $t0, ' '              # Load space character
sb $t0, 0($s1)           # Store space character to output_string
addi $s1, $s1, 1         # Increment index for output_string


# Load addresses of the strings into registers
    la $s4, test_name       # Address of test_name_from_file
    la $v1, test_BPT    # Address of test_name_chosen_by_user
# Save register values onto the stack
subi $sp, $sp, 20      # Adjust stack pointer to make space for 5 registers (5 * 4 bytes = 20 bytes)

sw $t1, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
 # Call the string comparison subroutine
    jal cmploop
    
# Restore register values from the stack

lw $t0, 4($sp)         # Restore $t0
lw $t1, 0($sp)         # Restore $a3


 beq $s7, $zero, s7_equal_0   # Branch to end_append_result if $t8 == 0


 li $v0, 4
    la $a0, diastolic_prompt
    syscall

   jal validate_result
    
    
      # Append test result to output_string
      li $t0 ,0
    move $s0, $zero       # Reset index for test_result
    append_loop_result_d:
        lb $t0, test_result($s0)   # Load byte from test_result
        beq $t0, 10, end_append_result_d
        sb $t0, 0($s1)             # Store byte to output_string
        addi $s0, $s0, 1           # Increment index for test_result
        addi $s1, $s1, 1           # Increment index for output_string
        
        j append_loop_result_d

end_append_result_d:


# Append ", " after month
li $t0, '/'              # Load comma character
sb $t0, 0($s1)           # Store comma character to output_string
addi $s1, $s1, 1         # Increment index for output_string


    li $v0, 4
    la $a0, systolic_prompt
    
    syscall

     jal validate_result
    
    
      # Append test result to output_string
    move $s0, $zero       # Reset index for test_result
    li $t0 ,0
    append_loop_result2:
        lb $t0, test_result($s0)   # Load byte from test_result
        beq $t0, 10, end_append_result2
        sb $t0, 0($s1)             # Store byte to output_string
        addi $s0, $s0, 1           # Increment index for test_result
        addi $s1, $s1, 1           # Increment index for output_string
        j append_loop_result2

s7_equal_0:

li $v0, 4
    la $a0, result_prompt
    syscall

     jal validate_result
    
    
      # Append test result to output_string
    move $s0, $zero       # Reset index for test_result
    li $t0 ,0
    append_loop_result:
        lb $t0, test_result($s0)   # Load byte from test_result
        beq $t0, 10, end_append_result
        sb $t0, 0($s1)             # Store byte to output_string
        addi $s0, $s0, 1           # Increment index for test_result
        addi $s1, $s1, 1           # Increment index for output_string
        
        j append_loop_result

end_append_result:

   

# clear_buffer
    # Load the address of the buffer into a register
    la $t0, test_result
    
    # Set the number of bytes to clear
    li $t1, 15
   
   jal clear_loop
   
   
end_append_result2:
    
   
# clear_buffer
    # Load the address of the buffer into a register
    la $t0, test_result
    
    # Set the number of bytes to clear
    li $t1, 15
   
   jal clear_loop 
    
    
    
     #Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, add_success_message
    syscall
    
 # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, newline
    syscall
    
     # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, dashes_prompt
    syscall
 
   
    # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, before_add_success_message
    syscall
    
    
       # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, dashes_prompt
    syscall
    
    
      jal readtestFile      # Call the readtestFile function
   
    
   
   
   
   # Calculate the length of the output_string
move $s2, $zero         # Initialize counter for string length
la $s3, output_string   # Load address of output_string

calc_string_lengthh:
    lb $t0, 0($s3)      # Load byte from output_string
    beqz $t0, end_calc_string_lengthh  # If byte is zero (end of string), exit loop
    addi $s2, $s2, 1    # Increment string length counter
    addi $s3, $s3, 1    # Move to the next byte of the string
    j calc_string_lengthh

end_calc_string_lengthh:


     # Open file for writing (create if not exist)
    li $v0, 13           # Open syscall
    la $a0, filename     # Load file path
    li $a1, 9            # Open for writing (create if not exist)
    li $a2, 0            # File permissions
    syscall
    move $s0, $v0        # Save file descriptor
    
   
	# Write into the file
	li $v0, 15              # write_file syscall code = 15
	move $a0, $s0           # File descriptor (fileName)
	la $a1, output_string   # The text that will be written in the file
	move $a2, $s2           # File size (length of the string)
	syscall
    
    

    # Close file
    li $v0, 16           # Close syscall
    move $a0, $s0        # File descriptor
    syscall
    
    
    #Clear buffer and write file into it again
    
    
    
    
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
    la $t0,  test_result
    
    # Set the number of bytes to clear
    li $t1, 8
   
   jal clear_loop
   
   # clear_buffer
    # Load the address of the buffer into a register
    la $t0,  output_string
    
    # Set the number of bytes to clear
    li $t1, 256
   
   jal clear_loop
   
   
   
     
       # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, newline
    syscall
    
     # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, dashes_prompt
    syscall
 
   
    # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, after_add_success_message
    syscall
      # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, dashes_prompt
    syscall

    
      jal readtestFile      # Call the readtestFile function
   
     

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
    
    jr $ra  # Return from the subroutine




    
search_test_by_id:

	li $v0 ,0
    # Display second menu options
    li $v0, 4
    la $a0, second_menu_options
    syscall
enter_valid_option_second_menu:
    # Prompt user for choice
    li $v0, 4
    la $a0, second_menu_prompt
    syscall
    
# Read user input
li $v0, 12        # Read integer syscall
syscall
   
    
    # Process user choice
    beq $v0, 49, retrieve_all_tests
    beq $v0, 50, search_unnormal_tests
    beq $v0, 51, retrieve_tests_in_period
    beq $v0, 52, return_to_main_menu
    j invalid_choiceee_second_menu
    
    
    
    invalid_choiceee_second_menu:
    # Display an error message for invalid choice
    li $v0, 4          # syscall code for print_string
    la $a0, invalid_choice_msg_for_test_type # load address of invalid_choice_msg string
    syscall            # print the error message
    j enter_valid_option_second_menu            # Go back to the main menu


retrieve_all_tests:

    # Code to retrieve all patient tests
    
        li $v0, 4            # Print string syscall
	la $a0, patient_id_prompt
	syscall
	
     # Call the function validate id to ask user about id
     jal validate_id

    
        
   # Load the address of the buffer into $a3
    la $a3, buffer
    
    # Initialize index for storing IDs in the array
    li $t0, 0
    
    li $t3, 0x3A    # ASCII value for ':
      # Load the base address of ids_array into $t5
      
    la $t5, ids_array
    
    # Initialize the flag register (this to make sure if the id stored to go to the next id
    li $t7, 0
    
       li $a1, 0
       li $k1, 0
  li $t4,0

    
parse_loop:

#-----------------------------------
#start reading id in each line :
#-----------------------------------
   
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    # Check if the byte is null terminator '\0'
    beq $a1, $zero, chek_k1   # If null terminator found, end parse loop
    
    
    # Check if flag t7 is 0 ; if it is 0 then extract the id  by going to continue_parsing  and then check if it is equal to the input id
    #if it is 1  go to the next line to extract new id 
    beq $t7, $zero, continue_parsing
    
    
    
    
    # Walk in the buffer until "\n" is found
search_newline:
    # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    # Check if the byte is null terminator '\0'
    beq $a1, $zero, chek_k1   # If null terminator found, end parse loop
    
    
    # Check if the byte is newline character '\n'
    li $t8, 0x0A    # ASCII value for '\n'
    beq $a1, $t8, reset_flag   # If newline found, reset flag and continue parsing
    
    # Move to the next byte in the buffer
    addi $a3, $a3, 1
    
    j search_newline

reset_flag:
    # Reset flag t7
    li $t7, 0
    
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    # Check if the byte is null terminator '\0'
    beq $a1, $zero, chek_k1  # If null terminator found, end parse loop
    
    # Continue parsing loop
    j parse_loop

continue_parsing:
    # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    # Check if the byte is a digit or a (:) colon
    li $t1, 0x30    # ASCII value for '0'
    beq $a1, $t3, store_id
    
    # Store str
    # Store date
    # Store result
    
    blt $a1, $t1, next_iteration
    
    # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t4, $t4, 10   # Multiply current ID by 10
    add $t4, $t4, $a1  # Add new digit to ID
    
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
    sll $t6, $t0, 2      # Multiply the index by 4 (shift left by 2) to account for each integer being 4 bytes
    
    # Add the offset to the base address of ids_array
    add $t5, $t5, $t6   # $t5 now holds the address of ids_array[index]

    # Store the value of $t4 into the memory location pointed to by $t5
    sw $t4, 0($t5)      # Store the value of $t4 as a word at the calculated memory location
    
    
    
    #brint the line if the id = user input
      beq $t4, $t9, equal_branch     # Branch to equal_branch if $t4 is equal to $t9
    # Code to execute if $t4 is not equal to $t9
    j next_instruction              # Jump to next_instruction

equal_branch:
	li $k1 ,1
    jal print_specific_line        # Call print_specific_line if $t4 is equal to $t9

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
chek_k1:
    # Check if k0 is equal to 0
	beq $k1, $zero, not_valid_id

    j search_test_by_id  #to go to choice 2 minu again

not_valid_id:

# Invalid choice message
    li $v0, 4
    la $a0, not_valid_id_msg
    syscall

enter_again:
# Ask to continue or return to menu
li $v0, 4                       # Print string syscall
la $a0, continue_or_return_menu # Load address of message
syscall

# Handle user input for continuing or returning to the menu

# Read user input
li $v0, 12        # Read integer syscall
syscall
move $v1, $v0     # Move user input to $v1

handle_inputt:
beq $v1, 99, retrieve_all_tests      # If the input is 'c' (ascii value 99), branch to update_test
beq $v1, 109, menu             # If the input is 'm' (ascii value 109), branch to menu




invalid_choice:
    # Invalid choice message
    li $v0, 4
    la $a0, invalid_input_msg
    syscall
    j enter_again
 
 
 
 
# Function to print a specific line from the buffer based on t0 value
print_specific_line:

    # Print the specific line
    la $k0, buffer # Load address of buffer_string
    li $k1, 0      # Counter for newline characters
    li $s5, 0      # Index for characters in buffer_string

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
    
    # Check for newline
    beq $t4, '\0', done
    

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

    jr $ra  # Return from the subroutine




retrieve_abnormal_tests:
    # Code to retrieve all abnormal patient tests
    
     # Code to retrieve all abnormal patient tests
    # means normal tests by id 
    
	####
	retrieve_all_up_normal_tests:




  # Prompt user for the patient ID
    li $v0, 4
    la $a0, IDenteringPrompt
    syscall

    # Read the patient ID as a string
    li $v0, 8
    la $a0, enteredID
    li $a1, 20
    syscall


    li $s7, 0 # s7= 0 means the end of the file is not reached yet
    la $a0, buffer # a0 points to the start of the buffer


check_IDs_infile:

    move $t9, $a0 # Save the address of the start of the buffer in $t9

    jal doesIDexistinthefile #  retrun 1 in t5 if the ID is equal to the enteredID

    #if the t5 = 1 mean the ID is equal to the enteredID
    #else the ID is not equal to the enteredID

    #if the ID entered by the user is found in hte file then branch to check_if_test_isNormal

    beq $t5, 1, check_if_test_isNormal
    jal gotoNEXTline
    beq $s7, 1, menu
    j check_IDs_infile



    ################################################################normal range for each test#######################################

    # Normal range for each test:
    #1. Hemoglobin (Hgb): 13.8 to 17.2 grams per deciliter 

    #2. Blood Glucose Test (BGT): Normal Range Between 70 to 99 milligrams per deciliter (mg/dL) 

    #3. LDL Cholesterol Low-Density Lipoprotein (LDL): Normal Range Less than 100 mg/dL

    #4. Blood Pressure Test (BPT): Normal Range: Systolic Blood Pressure: Less than 120 millimeters of 
    #   mercury (mm Hg). Diastolic Blood Pressure: Less than 80 mm Hg 

    ################################################################normal range for each test#######################################

check_if_test_isNormal: 

            move $a0, $t9          # Load the address of the start of the line into $a0
            jal line_test_values 

           #this function returns the test result in $f1 , the type of test in $t4 and the address of the start of the next line in $a0

            beq $t4, 1, HgbNormal
            beq $t4, 2, BGTNormal
            beq $t4, 3, LDLNormal
            beq $t4, 4, BPTNormal


            HgbNormal:
                            lwc1 $f3, lowerBoundHgb # Load the lower bound value, which is 13.8
                            lwc1 $f4, upperBoundHgb # Load the upper bound value, which is 17.2

                            c.lt.s $f1, $f3         # Compare the test result in $f1 with the lower bound $f3
                            bc1t ResultUNnormal   # If the test result is less than the lower bound, branch to ResultUNnormal

                            c.le.s $f4, $f1         # Compare the test result in $f1 with the upper bound $f4
                            bc1t ResultUNnormal   # If the test result is greater than the upper bound, branch to ResultUNnormal

                            move $a0, $t9           # Load the address of the start of the line into $a0
                            jal printLine             # Jump to printLine to print the data for this line
                            
                            beq $s7, 1, menu # If the end of the file is reached, return to the menu
                            j check_IDs_infile       # Continue to check file IDs							
                                                        
                                    
            BGTNormal:

                           lwc1 $f3, lowerBoundBGT # Load the lower bound value is 70.0
                           lwc1 $f4, upperBoundBGT # Load the upper bound value is 99.0

                           c.lt.s $f1, $f3         # Compare the test result in $f1 with the lower bound $f3
                           bc1t ResultUNnormal   # If the test result is less than the lower bound, branch to ResultUNnormal

                           c.lt.s $f4, $f1         # Compare the test result in $f1 with the upper bound $f4
                           bc1t ResultUNnormal   # If the test result is greater than the upper bound, branch to ResultUNnormal
                           
                           move $a0, $t9          # Load the address of the start of the line into $a0
                           jal printLine          # f(a0) print the data for this line 

                           beq $s7, 1, menu
                           j  check_IDs_infile             
                           
                           
            LDLNormal:

                            lwc1 $f4, upperBoundLDL  # Load the upper bound value of 100.0 into $f3
                            c.le.s $f4, $f1          # Compare the test result in $f1 with the upper bound in $f3
                            bc1t ResultUNnormal    # If $f1 is not less than or equal to $f3 (i.e., $f1 is greater than $f3), branch to end_findNextLine

                            move $a0, $t9          # Load the address of the start of the line into $a0
                            jal printLine          # f(a0) print the data for this line 

                            beq $s7, 1, menu
                            j  check_IDs_infile         
                        		
            BPTNormal: 
                            lwc1 $f4, upperBoundSystolicBPT # Load the upper bound value is 120.0
                            lwc1 $f3, upperBoundDiastolicBPT # Load the upper bound value is 80.0

                            c.lt.s $f4, $f5         # Compare the test result in $f1 with the lower bound $f3
                            bc1t ResultUNnormal   # If the test result is less than the lower bound, branch to ResultUNnormal

                            c.le.s $f3, $f1         # Compare the test result in $f1 with the upper bound $f4
                            bc1t ResultUNnormal   # If the test result is greater than the upper bound, branch to ResultUNnormal

                            move $a0, $t9          # Load the address of the start of the line into $a0
                            jal printLine         # f(a0) print the data for this line(normal data)

                            beq $s7, 1, menu
                            j  check_IDs_infile


    ResultUNnormal:
    
                  move $a0, $t9          # Load the address of the start of the line into $a0  
                  jal gotoNEXTline
                  j check_IDs_infile

    
    		j search_test_by_id

retrieve_tests_in_period:
    # Code to retrieve tests in a given specific period
    
    
li $t9,0 #initialize t9 to store patient id input


#----------------enter patient id ---------------------- 
        li $v0, 4            # Print string syscall
	la $a0, patient_id_prompt
	syscall
	
   # Call the function validate id to ask user about id and store it into t9
     jal validate_id
    
li $s4,0 #initialize s4 to store first year input
li $v1,0 #initialize v1 to store first month input
li $s6,0 #initialize s6 to store second year input
li $s7,0 #initialize s7 to store second month input
li $t5,0 #initialize s6 to store second year input
li $t6,0 #initialize s7 to store second month input
li $k1,0 #initialize k1 for validate input
li $t0,0 #initialize k1 for validate input


#----------------enter the first date---------------------- 

  # Prompt user for the first year
li $v0, 4            # Print string syscall
la $a0, first_date_prompt
syscall

  
#1. enter year
      
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_year
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $s4, $t8          # Move the value of $t8 to $k0 --- year in k0

#2. enter month
# Prompt user for the first month
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_month
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $v1, $t8          # Move the value of $t8 to $k1 --- month in k0
    

#----------------enter the second period---------------------- 

  # Prompt user for the first year
li $v0, 4            # Print string syscall
la $a0, second_date_prompt
syscall

#1. enter year
      
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_year
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $s6, $t8          # Move the value of $t8 to $k0 --- year in k0

#2. enter month
# Prompt user for the first month
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_month
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $s7, $t8          # Move the value of $t8 to $k1 --- month in k0
    
#-----------------------start with finding available patient periods ---------------------------         
        
   # Load the address of the buffer into $a3
    la $a3, buffer
    
    # Initialize index for storing IDs in the array
    li $t0, 0
    
    li $t3, 0x3A    # ASCII value for ':
     
    
    # Initialize the flag register (this to make sure if the id stored to go to the next id
    li $t7, 0
    
     li $a1, 0
     
        move $t0, $zero # $t0 is now zero
mult $t0, $zero # the result of the multiplication is zero, stored in `lo` and `hi`
mflo $31       # move the result from `lo` to `lo`, this is effectively a reset

    li $t0,0
    
     li $t4,0
    
    
    
iterate_file_lines:

#-----------------------------------
#start reading id in each line :
#-----------------------------------
   
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    # Check if the byte is null terminator '\0'
    beq $a1, $zero, end_file   # If null terminator found, end parse loop
    
    
    # Check if flag t7 is 0 ; if it is 0 then extract the id  by going to continue_parsing  and then check if it is equal to the input id
    #if it is 1  go to the next line to extract new id 
    beq $t7, $zero, combine_id
    
    
    
    
    # Walk in the buffer until "\n" is found
skip_till_newline:
    # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    # Check if the byte is null terminator '\0'
    beq $a1, $zero, end_file   # If null terminator found, end parse loop
    
    
    # Check if the byte is newline character '\n'
    li $t8, 0x0A    # ASCII value for '\n'
    beq $a1, $t8, reset_flag_to_compine_new_id    # If newline found, reset flag and continue parsing
    
    # Move to the next byte in the buffer
    addi $a3, $a3, 1
    
    j skip_till_newline

reset_flag_to_compine_new_id:
    # Reset flag t7
    li $t7, 0
    
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    # Check if the byte is null terminator '\0'
    beq $a1, $zero, end_file  # If null terminator found, end parse loop
    
    # Continue parsing loop
    j iterate_file_lines

combine_id:
    # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    # Check if the byte is a digit or a (:) colon
    li $t1, 0x30    # ASCII value for '0'
    beq $a1, $t3, the_id_is_in_t4
    
    # Store str
    # Store date
    # Store result
    
    blt $a1, $t1, next_byte
    
    # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t4, $t4, 10   # Multiply current ID by 10
    add $t4, $t4, $a1  # Add new digit to ID
    
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
      beq $t4, $t9, desired_id      # Branch to equal_branch if $t4 is equal to $t9
    # Code to execute if $t4 is not equal to $t9
    j next_line              # Jump to next_instruction

desired_id :

#-----------------------------------
#extract the year and month from desired line to check then its period
# year -> t5 ,   month  -> t6
#-----------------------------------



   # Reset $t5, t6 for each line
    li $t5, 0
    li $t6, 0
    
   # Move to the year byte in the buffer
    addi $a3, $a3, 7
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t5, $t5, 10   # Multiply current ID by 10
    add $t5, $t5, $a1  # Add new digit to ID
    
    
   
    
    
    
    # Move to the next byte in the buffer
    addi $a3, $a3, 1
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t5, $t5, 10   # Multiply current ID by 10
    add $t5, $t5, $a1  # Add new digit to ID
    
    
    
    

 # Move to the next byte in the buffer
    addi $a3, $a3, 1
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t5, $t5, 10   # Multiply current ID by 10
    add $t5, $t5, $a1  # Add new digit to ID
    
    
    
    
     # Move to the next byte in the buffer
    addi $a3, $a3, 1
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
  
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t5, $t5, 10   # Multiply current ID by 10
    add $t5, $t5, $a1  # Add new digit to ID
    
   
    
    
#---------------------year is ready---------------------------
    
     # Move to the year byte in the buffer
    addi $a3, $a3, 2
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t6, $t6, 10   # Multiply current ID by 10
    add $t6, $t6, $a1  # Add new digit to ID
    
    
      
     # Move to the year byte in the buffer
    addi $a3, $a3, 1
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t6, $t6, 10   # Multiply current ID by 10
    add $t6, $t6, $a1  # Add new digit to ID
    
    
   
    
#---------------------month is also ready---------------------------


#------------check period logic -----------


# Check if the date in t5/t6 falls within the period defined by s4/v1/s6/s7
# year in t5, month in t6
# least date in s4, v1; large date in s6, s7


# Check if the date is within the specified period

# Compare with the least year
bge $t5, $s4, check_large_year # If t5 (year) is greater than or equal to s4 (least year), check large year
b date_out_of_range # If t5 (year) is less than s4 (least year), it's out of range

check_large_year:
# Compare with the large year
ble $t5, $s6, check_month # If t5 (year) is less than or equal to s6 (large year), check month
b date_out_of_range # If t5 (year) is greater than s6 (large year), it's out of range

check_month:
# Check if the month is within range
# If the year is within the range, then check the month

# Compare with the least month if the year is equal to the least year
beq $t5, $s4, check_least_month

# Compare with the large month if the year is equal to the large year
beq $t5, $s6, check_large_month

# If the year is between the least and large years, the month is within range
b within_month_range

check_least_month:
# If the year is equal to the least year, compare with the least month
bge $t6, $v1, within_month_range # If t6 (month) is greater than or equal to v1 (least month), it's within range!!!
b date_out_of_range # If t6 (month) is less than v1 (least month), it's out of range

check_large_month:
# If the year is equal to the large year, compare with the large month
ble $t6, $s7, within_month_range # If t6 (month) is less than or equal to s7 (large month), it's within range
b date_out_of_range # If t6 (month) is greater than s7 (large month), it's out of range

within_month_range:


# The given date is within the specified period
li $k1,1
 jal print_specific_line        # Call print_specific_line if $t4 is equal to $t9

date_out_of_range:
# The given date is outside the specified period
# complete with next line



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

    
    # Check if k0 is equal to 0
	beq $k1, $zero, not_valid_idd

    j search_test_by_id  #to go to choice 2 minu again

not_valid_idd:

# Invalid choice message
    li $v0, 4
    la $a0, not_valid_id_date_msg
    syscall

enter_againn:
# Ask to continue or return to menu
li $v0, 4                       # Print string syscall
la $a0, continue_or_return_menu # Load address of message
syscall

# Handle user input for continuing or returning to the menu

# Read user input
li $v0, 12        # Read integer syscall
syscall
move $v1, $v0     # Move user input to $v1

handle_inputtt:
beq $v1, 99,retrieve_tests_in_period      # If the input is 'c' (ascii value 99), branch to update_test
beq $v1, 109, menu             # If the input is 'm' (ascii value 109), branch to menu




invalid_choicee:
    # Invalid choice message
    li $v0, 4
    la $a0, invalid_input_msg
    syscall
    j enter_againn
   
 
  
    
    
    

return_to_main_menu:
    # Code to return to the main menu
    j menu





    
 
 

search_unnormal_tests:





 # Prompt user for the test ID
    li $v0, 4
    la $a0, IDenteringPrompt
    syscall

    # Read the test ID as a string
    li $v0, 8
    la $a0, enteredID
    li $a1, 20
    syscall


li $s7, 0 # Initialize the flag to 0
la $a0, buffer # Load the address of the buffer into $a0


check_IDs_infile_unnormal:

    move $t9, $a0 # Save the address of the start of the buffer in $t7

    jal doesIDexistinthefile # f(a0 , enteredID) retrun 1 in t5 if the ID is equal to the enteredID

    #if the t5 = 1 mean the ID is equal to the enteredID
    #else the ID is not equal to the enteredID

    beq $t5, 1, check_test_resultUnnormal
    jal gotoNEXTline
    beq $s7, 1, menu
    j check_IDs_infile_unnormal



  
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
            
            beq $t4, 1, HgBUNnormal
            beq $t4, 2, BGTUNnormal
            beq $t4, 3, LDLUNnormal
            beq $t4, 4, BPTUNnormal


            HgBUNnormal:
            
                            lwc1 $f3, lowerBoundHgb # Load the lower bound value, which is 13.8
                            lwc1 $f4, upperBoundHgb # Load the upper bound value, which is 17.2

                            c.lt.s $f1, $f3         # Compare the test result in $f1 with the lower bound $f3
                            bc1t UNnormalPrinting   # If the test result is less than the lower bound, branch to ResultUNnormal

                            c.lt.s $f4, $f1         # Compare the test result in $f1 with the upper bound $f4
                            bc1t UNnormalPrinting   # If the test result is greater than the upper bound, branch to ResultUNnormal


                       
                            
                            beq $s7, 1, menu  # If the end of the file is reached, return to the menu
                            j check_IDs_infile_unnormal       # Continue to check file IDs							
                                                        
                                    
                    
            BGTUNnormal:

                           lwc1 $f3, lowerBoundBGT # Load the lower bound value is 70.0
                           lwc1 $f4, upperBoundBGT # Load the upper bound value is 99.0

                           c.lt.s $f1, $f3         # Compare the test result in $f1 with the lower bound $f3
                           bc1t UNnormalPrinting   # If the test result is less than the lower bound, branch to ResultUNnormal

                           c.lt.s $f4, $f1         # Compare the test result in $f1 with the upper bound $f4
                           bc1t UNnormalPrinting   # If the test result is greater than the upper bound, branch to ResultUNnormal
                           

                           beq $s7, 1, menu
                           j  check_IDs_infile_unnormal                                        

            LDLUNnormal:

 
                            lwc1 $f4, upperBoundLDL  # Load the upper bound value of 100.0 into $f3
                            c.le.s $f4, $f1          # Compare the test result in $f1 with the upper bound in $f3
                            bc1t UNnormalPrinting    # If $f1 is not less than or equal to $f3 (i.e., $f1 is greater than $f3), branch to end_findNextLine
                           
                            beq $s7, 1, menu
                            j  check_IDs_infile_unnormal         
                        		
            BPTUNnormal: 

                            lwc1 $f4, upperBoundSystolicBPT # Load the upper bound value is 120.0
                            lwc1 $f3, upperBoundDiastolicBPT # Load the upper bound value is 80.0

                            c.le.s $f3, $f1         # Compare the test result in $f1 with the lower bound $f3
                            bc1t UNnormalPrinting   # If the test result is less than the lower bound, branch to ResultUNnormal

                            c.le.s $f4, $f5         # Compare the test result in $f1 with the upper bound $f4
                            bc1t UNnormalPrinting   # If the test result is greater than the upper bound, branch to ResultUNnormal


                            beq $s7, 1, menu
                            j  check_IDs_infile_unnormal



              UNnormalPrinting:
                  
                            move $a0, $t9           # Load the address of the start of the line into $a0
                            jal printLine             # Jump to printLine to print the data for this line
                            
                            beq $s7, 1, menu  # If the end of the file is reached, return to the menu
                            j check_IDs_infile_unnormal       # Continue to check file IDs			

                                    


    j menu





####################################
#this function checks if the entered ID equals the ID in each line of the file
#it rerturns 1 if id is equal to the enteredI, 0 otherwise

doesIDexistinthefile:

# a0 for the line .

    move $t8, $ra # save the return address so it doesn't get messed up

    move $t7 , $a0 # the current line pointed by a0 is saved in t7

    # Search for the test ID in the buffer
  
    # Initialize $t3 with 0 for summing ASCII values of enteredID

    li $t3, 0
    la $a0, enteredID
    jal calculateSum       # Calculate sum of ASCII values in enteredID
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



#---------------------------------------End of Check Id is equal to the enteredI------------------




#------------------------calculate the sum of the ASCII values in the enteredI--------------
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


#-------------------------------------End of calculate the sum of the ASCII values in the enteredI----------------


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
gotoNEXTline:
    # f(a0) return --> in a0 the start of the next line , s7 = 1 if the buffer is done, 0 otherwise

    lb $a1 , 0($a0) # Load the next character from the buffer into $a1
    beq $a1, '\0', noNextLIne  # End of data for this line
    beq $a1, '\n', done_gotoNEXTline  # End of data for this line
    addiu $a0, $a0, 1      # Move to the next character in buffer
    j gotoNEXTline         # Continue printing data

   done_gotoNEXTline: 
    addiu $a0, $a0, 1      # Move to the next line
    lb $a1 , 0($a0) # Load the next character from the buffer into $a1
    beq $a1, '\0', noNextLIne  # End of data for this line
    jr $ra

    noNextLIne:
    li $s7 , 1 # set the value of s7 to 1 to indicate that the buffer is done.
    jr $ra
    
    

#-----------------------------------End of function to get the next line--------------------------------------------



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
    lwc1 $f24, 0($a0)      # Load the floating-point zero into $f24 #for the BPT second reading





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
                        add.s $f24, $f24, $f5 #second reading
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
            div.s $f16, $f24, $f15  # Average for BPT #second reading
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

            mov.s $f12, $f16  # Load average BPT for printing #second reading
            li $v0, 2         # Print float
            syscall


               # Print newline character
   	        li $v0, 11          # System call for printing a character
             li $a0, 10          # Load ASCII value of newline ('\n') into $a0
             syscall 

            j menu
               

#----------------------------------------------end of get average test value-----------------------------------------------
##############################################             





update_test:

 # Code to update test result
    
    
li $t9,0 #initialize t9 to store patient id input !!used


#----------------enter patient id ---------------------- 
   li $v0, 4            # Print string syscall
	la $a0, patient_id_prompt
	syscall
 # Call the function validate id to ask user about id and store it into t9
     jal validate_id
     
li $s4,0 #initialize s4 to be the address to store file test name
li $v1,0 #initialize v1 to for invalid (id+test type)
li $s6,0 #this used for loop 23 time
li $s7,0 #this used as a flag in compare section ( 1 -> string are equal)	
li $t5,0 #used to store test name from the user   !!used
li $t6,0 #initialize s7 to store second month input
li $k0,0 #used to store test name from the user   !!used
li $k1,0 #initialize s7 to store second month input
 
    
    
#----------------choose test name ---------------------- 
    
    
    
    #clear  test_name_chosen_by_user  
    # Load the address of the test_name_chosen_by_user   into a register
    la $t0, test_name_chosen_by_user  
    
    # Set the number of bytes to clear
    li $t1, 4
   
   jal clear_loop
   
   
   #clear  test_name_chosen_by_user  
    # Load the address of the test_name_chosen_by_user   into a register
    la $t0, new_test_result 
    # Set the number of bytes to clear
    li $t1, 7
   jal clear_loop
   
   
    #clear  test_name_chosen_by_user  
    # Load the address of the test_name_chosen_by_user   into a register
    la $t0, diastolic_result 
    # Set the number of bytes to clear
    li $t1, 7
   jal clear_loop
   
    #clear  test_name_chosen_by_user  
    # Load the address of the test_name_chosen_by_user   into a register
    la $t0, systolic_result 
    # Set the number of bytes to clear
    li $t1, 7
   jal clear_loop
   
   
  
    # Display the menu prompt
    li $v0, 4          # syscall code for print_string
    la $a0, prompt     # load address of prompt string
    syscall            # print the prompt
    
   

 enter_valid_option:
    # Get user input
       li $v0, 12          # syscall code for reading character
    syscall


    la $t0, test_name_chosen_by_user  
    # Check the user's choice and store the corresponding test name
    beq $v0, 49, choice_1 # If the choice is 1, jump to choice_1
    beq $v0, 50, choice_2 # If the choice is 2, jump to choice_2
    beq $v0, 51, choice_3 # If the choice is 3, jump to choice_3
    beq $v0, 52, choice_4 # If the choice is 4, jump to choice_4
    j invalid_choiceee     # Otherwise, jump to invalid_choice

choice_1:
    

   # Store "Hemoglobin (Hgb)" into test_name_chosen_by_user
    li $t5, 'H'          # Load the ASCII value of 'H' into $t5
    sb $t5, 0($t0)       # Store 'H' into the memory location pointed by $t
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'g'          # Load the ASCII value of 'g' into $t5
    sb $t5, 0($t0)       # Store 'g' into the memory location pointed by $t0
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'b'          # Load the ASCII value of 'b' into $t5
    sb $t5, 0($t0)       # Store 'b' into the memory location pointed by $t0
    
    #----------------enter the date---------------------- 


#1. enter year
      
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_year
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k0, $t8          # Move the value of $t8 to $k0 --- year in k0

#2. enter month
# Prompt user for the first month
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_month
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k1, $t8          # Move the value of $t8 to $k1 --- month in k0
    
      # Prompt user to enter the new test result

    li $v0, 4            # Load system call code for print string
    la $a0, update_test_prompt  # Load address of the update test prompt
    syscall

    # Read the new test result from user input
    li $v0, 8            # Load system call code for read string
    la $a0, new_test_result  # Load address of the new test result variable
    li $a1, 7            # Load maximum length of input
    syscall
    
    
    

    j name_chosen        # Jump to end_program to terminate the program
    
    
    

choice_2:
    # Store "Blood Glucose Test (BGT)" into test_name_chosen_by_user

    li $t5, 'B'          # Load the ASCII value of 'H' into $t5
    sb $t5, 0($t0)       # Store 'H' into the memory location pointed by $t
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'G'          # Load the ASCII value of 'g' into $t5
    sb $t5, 0($t0)       # Store 'g' into the memory location pointed by $t0
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'T'          # Load the ASCII value of 'b' into $t5
    sb $t5, 0($t0)       # Store 'b' into the memory location pointed by $t0
    
    #----------------enter the date---------------------- 


#1. enter year
      
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_year
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k0, $t8          # Move the value of $t8 to $k0 --- year in k0

#2. enter month
# Prompt user for the first month
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_month
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k1, $t8          # Move the value of $t8 to $k1 --- month in k0

    
      # Prompt user to enter the new test result

    li $v0, 4            # Load system call code for print string
    la $a0, update_test_prompt  # Load address of the update test prompt
    syscall

    # Read the new test result from user input
    li $v0, 8            # Load system call code for read string
    la $a0, new_test_result  # Load address of the new test result variable
    li $a1, 7            # Load maximum length of input
    syscall
    
    


    

    j name_chosen         # Jump to end_program to terminate the program

choice_3:
    # Store "LDL Cholesterol (LDL)" into test_name_chosen_by_user
     # Store "Hemoglobin (Hgb)" into test_name_chosen_by_user
    li $t5, 'L'          # Load the ASCII value of 'H' into $t5
    sb $t5, 0($t0)       # Store 'H' into the memory location pointed by $t
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'D'          # Load the ASCII value of 'g' into $t5
    sb $t5, 0($t0)       # Store 'g' into the memory location pointed by $t0
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'L'          # Load the ASCII value of 'b' into $t5
    sb $t5, 0($t0)       # Store 'b' into the memory location pointed by $t0
    
    #----------------enter the date---------------------- 


#1. enter year
      
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_year
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k0, $t8          # Move the value of $t8 to $k0 --- year in k0

#2. enter month
# Prompt user for the first month
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_month
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k1, $t8          # Move the value of $t8 to $k1 --- month in k0

      # Prompt user to enter the new test result

    li $v0, 4            # Load system call code for print string
    la $a0, update_test_prompt  # Load address of the update test prompt
    syscall

    # Read the new test result from user input
    li $v0, 8            # Load system call code for read string
    la $a0, new_test_result  # Load address of the new test result variable
    li $a1, 7            # Load maximum length of input
    syscall
  


    j name_chosen         # Jump to end_program to terminate the program

choice_4:
    # Store "Blood Pressure Test (BPT)" into test_name_chosen_by_user
    # Store "Hemoglobin (Hgb)" into test_name_chosen_by_user
    li $t5, 'B'          # Load the ASCII value of 'H' into $t5
    sb $t5, 0($t0)       # Store 'H' into the memory location pointed by $t
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'P'          # Load the ASCII value of 'g' into $t5
    sb $t5, 0($t0)       # Store 'g' into the memory location pointed by $t0
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'T'          # Load the ASCII value of 'b' into $t5
    sb $t5, 0($t0)       # Store 'b' into the memory location pointed by $t0
    
                #----------------enter the date---------------------- 


#1. enter year
      
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_year
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k0, $t8          # Move the value of $t8 to $k0 --- year in k0

#2. enter month
# Prompt user for the first month
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_month
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k1, $t8          # Move the value of $t8 to $k1 --- month in k0

                # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, diastolic_prompt
    syscall

    li $v0, 8            # Read string syscall
    la $a0, diastolic_result
    li $a1, 20           # Maximum length of patient ID
    syscall
    


    # Append patient ID to output_string
move $s0, $zero       # Initialize index for output_string
la $s1, new_test_result # Load address of output_string



append_loop_diastolic:
    lb $t0, diastolic_result($s0)    # Load byte from patient_id
    beq $t0, 10, end_append_diastolic # Check if byte is newline character

    sb $t0, 0($s1)             # Store byte to output_string
    addi $s0, $s0, 1           # Increment index for patient_id
    addi $s1, $s1, 1           # Increment index for output_string
    j append_loop_diastolic

end_append_diastolic:

# Append ": " after patient ID
li $t0, '/'              # Load colon character
sb $t0, 0($s1)           # Store colon character to output_string
addi $s1, $s1, 1         # Increment index for output_string

# Prompt user for test name
li $v0, 4
la $a0, systolic_prompt
syscall

li $v0, 8
la $a0, systolic_result
li $a1, 20
syscall

# Append test name to output_string
move $s0, $zero       # Reset index for test_name
append_loop_systolic:
    lb $t0, systolic_result($s0)     # Load byte from test_name
    beq $t0, 10, end_append_systolic # Check if byte is newline character

    sb $t0, 0($s1)             # Store byte to output_string
    addi $s0, $s0, 1           # Increment index for test_name
    addi $s1, $s1, 1           # Increment index for output_string
    j append_loop_systolic
 end_append_systolic: 
 
 
 # Append ": " after patient ID
li $t0, '\n'              # Load colon character
sb $t0, 0($s1)           # Store colon character to output_string
addi $s1, $s1, 1         # Increment index for output_string

   
    # Display the new test result
    li $v0, 4                    # Load syscall code for printing string
    la $a0, new_test_result      # Load address of the new test result variable
    syscall                      # Print new test result



    
    j name_chosen        # Jump to end_program to terminate the program
    
    
    
    invalid_choiceee:
    # Display an error message for invalid choice
    li $v0, 4          # syscall code for print_string
    la $a0, invalid_choice_msg_for_test_type # load address of invalid_choice_msg string
    syscall            # print the error message
    j enter_valid_option             # Go back to the main menu

 

name_chosen:



#---------------test_name_chosen_by_user  ready to use------------------


#-----------------------start with  searching about line contains id=id , name=name to update its result ---------------------------         
        
   # Load the address of the buffer into $a3
    la $a3, buffer
    
    # Initialize index for storing IDs in the array
    li $t0, 0
    
    li $t3, 0x3A    # ASCII value for ':
     
    
    # Initialize the flag register (this to make sure if the id stored to go to the next id
    li $t7, 0
    
     li $a1, 0
     
     
       li $t4, 0
     
        move $t0, $zero # $t0 is now zero
mult $t0, $zero # the result of the multiplication is zero, stored in `lo` and `hi`
mflo $31       # move the result from `lo` to `lo`, this is effectively a reset

    
iterate_file_lines_part5:

#-----------------------------------
#start reading id in each line :
#-----------------------------------
   
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    # Check if the byte is null terminator '\0'
    beq $a1, $zero, end_file_part5  # If null terminator found, end parse loop
    
    
    # Check if flag t7 is 0 ; if it is 0 then extract the id  by going to continue_parsing  and then check if it is equal to the input id
    #if it is 1  go to the next line to extract new id 
    beq $t7, $zero, combine_id_part5
    
    
    
    
    # Walk in the buffer until "\n" is found
skip_till_newline_part5:
    # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    # Check if the byte is null terminator '\0'
    beq $a1, $zero, end_file_part5   # If null terminator found, end parse loop
    
    
    # Check if the byte is newline character '\n'
    li $t8, 0x0A    # ASCII value for '\n'
    beq $a1, $t8, reset_flag_to_compine_new_id_part5    # If newline found, reset flag and continue parsing
    
    # Move to the next byte in the buffer
    addi $a3, $a3, 1
    
    j skip_till_newline_part5

reset_flag_to_compine_new_id_part5:
    # Reset flag t7
    li $t7, 0
    
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    # Check if the byte is null terminator '\0'
    beq $a1, $zero, end_file_part5  # If null terminator found, end parse loop
    
    # Continue parsing loop
    j iterate_file_lines_part5

combine_id_part5:
    # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    # Check if the byte is a digit or a (:) colon
    li $t1, 0x30    # ASCII value for '0'
    beq $a1, $t3, the_id_is_in_t4_part5
    
    # Store str
    # Store date
    # Store result
    
    blt $a1, $t1, next_byte_part5
    
    # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t4, $t4, 10   # Multiply current ID by 10
    add $t4, $t4, $a1  # Add new digit to ID
    
    # Move to the next byte in the buffer
    addi $a3, $a3, 1
    
    # Repeat the loop
    j iterate_file_lines_part5

next_byte_part5:
    # Move to the next byte in the buffer
    addi $a3, $a3, 1
    
    # Repeat the loop
    j iterate_file_lines_part5
    
  
    
the_id_is_in_t4_part5:

    #brint the line if the id = user input
      beq $t4, $t9, desired_id_part5     # Branch to equal_branch if $t4 is equal to $t9
    # Code to execute if $t4 is not equal to $t9
    j next_line_part5             # Jump to next_instruction

desired_id_part5 :

#-----------------------------------
#extract the test name  ( test name = input test name then go to the update result part)
#-----------------------------------

# Save register values onto the stack
subi $sp, $sp, 20      # Adjust stack pointer to make space for 5 registers (5 * 4 bytes = 20 bytes)

sw $t1, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0


 # clear_test_name_from_file 
    # Load the address of the buffer into a register
    la $t0, test_name_from_file  
    
    # Set the number of bytes to clear
    li $t1, 4
   
   jal clear_loop

# Restore register values from the stack

lw $t0, 4($sp)         # Restore $t0
lw $t1, 0($sp)         # Restore $a3


   
la $s4, test_name_from_file # Load the address of test_name into $s4

# Move to the test name byte in the buffer
addi $a3, $a3, 2
# Load a byte from memory into $a1
lb $a1, 0($a3)
sb $a1, 0($s4)  # Store $a1 at the memory location pointed by $s4
addi $s4, $s4, 1  # Increment the address in $s4

addi $a3, $a3, 1
# Load a byte from memory into $a1
lb $a1, 0($a3)
sb $a1, 0($s4)  # Store $a1 at the memory location pointed by $s4
addi $s4, $s4, 1  # Increment the address in $s4

addi $a3, $a3, 1
# Load a byte from memory into $a1
lb $a1, 0($a3)
sb $a1, 0($s4)  # Store $a1 at the memory location pointed by $s4
    
 

# Load addresses of the strings into registers
    la $s4, test_name_from_file         # Address of test_name_from_file
    la $v1, test_name_chosen_by_user    # Address of test_name_chosen_by_user
# Save register values onto the stack
subi $sp, $sp, 20      # Adjust stack pointer to make space for 5 registers (5 * 4 bytes = 20 bytes)

sw $t1, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
 # Call the string comparison subroutine
    jal cmploop
    
# Restore register values from the stack

lw $t0, 4($sp)         # Restore $t0
lw $t1, 0($sp)         # Restore $a3

    
      # At this point, the result of the comparison is in $s7
    # Print appropriate message based on the result


    beq $s7, 1, equal_strings_update_result          # If $v0 is 1, strings are equal

    j next_line_part5 #not equal                      # Jump to end_program to terminate the program



equal_strings_update_result:

 # Reset $t5, t6 for each line
    li $t5, 0
    li $t6, 0
    
   # Move to the year byte in the buffer
    addi $a3, $a3, 3
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t5, $t5, 10   # Multiply current ID by 10
    add $t5, $t5, $a1  # Add new digit to ID
    
    
   
    
    
    # Move to the next byte in the buffer
    addi $a3, $a3, 1
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t5, $t5, 10   # Multiply current ID by 10
    add $t5, $t5, $a1  # Add new digit to ID
    
    
 # Move to the next byte in the buffer
    addi $a3, $a3, 1
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t5, $t5, 10   # Multiply current ID by 10
    add $t5, $t5, $a1  # Add new digit to ID
    
   
    
    
     # Move to the next byte in the buffer
    addi $a3, $a3, 1
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
  
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t5, $t5, 10   # Multiply current ID by 10
    add $t5, $t5, $a1  # Add new digit to ID
    
    
    
#---------------------year is ready---------------------------
    
     # Move to the year byte in the buffer
    addi $a3, $a3, 2
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t6, $t6, 10   # Multiply current ID by 10
    add $t6, $t6, $a1  # Add new digit to ID
    
    
      
     # Move to the year byte in the buffer
    addi $a3, $a3, 1
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t6, $t6, 10   # Multiply current ID by 10
    add $t6, $t6, $a1  # Add new digit to ID
    
  
    
#---------------------month is also ready---------------------------

# Check if k0 = t5 and k1 = t6
beq $k0, $t5, check_k1
j next_line_part5

check_k1:
    beq $k1, $t6, continue_to_update
    j next_line_part5



    

continue_to_update:
# Prompt before update
    li $v0, 4           # syscall code for printing string
    la $a0, prompt_before  # load address of the prompt string
    syscall
    
# Move t0 to k1
move $k1, $t0

    # Call print_specific_line
    jal print_specific_line

   
    
li $v1,1

 # Initialize registers
    la $s0, buffer      # Load address of buffer into $s0
    la $s1, new_buffer  # Load address of new_buffer into $s1
    la $t1, newline    # Load address of newline string
    lb $t1, 0($t1)     # Load byte (newline character) into $t1
    li $t2, 0           # Initialize counter $t2 to 0 to count \n
    li $t3, 23               # Load maximum number of bytes to copy
    
copy_loopp:
    beq $t0 , $zero , copy_loop_23_bytes   # this to delete the first line and continue copying others
    end_skip_linee:
    continue_copyingg:
    lb $k0, 0($s0)      # Load byte from buffer into $t0
    beq $k0, $zero, end_copyy  # If byte is '\0', exit loop
     # Check if the byte is '\n'
 
    
    sb $k0, 0($s1)      # Store byte from $t0 to new_buffer
    addi $s0, $s0, 1    # Move to next byte in buffer
    addi $s1, $s1, 1    # Move to next byte in new_buffer
    beq $k0, $t1, increment_counterr  # If byte is '\n', increment counter
    
    j continue_copyingg      # Repeat loop
    
 #if t0 = 0 (first line) skep until first \n   
skip_linee:

    lb $k0, 0($s0)      # Load byte from buffer into $t0
    beq $k0, $zero, end_copyy  # If byte is '\0', exit function
    addi $s0, $s0, 1    # Move to next byte in buffer
    # If byte is '\n', exit function
    beq $k0, $t1, end_skip_linee
    # If not '\n', continue skipping characters
 
    j skip_linee         # Repeat loop
    
    
  increment_counterr:
    addi $t2, $t2, 1    # Increment counter
    
    beq $t0 , $t2 , copy_23_bytes# this for check the line number according t0 \n (t2) value 
   
    j continue_copyingg         # Repeat loop
    
    
    copy_23_bytes:
   

copy_loop_23_bytes:
    lb $t4, 0($s0)           # Load byte from buffer into $t4
    beq $t4, $zero, end_copy_23_bytes  # If byte is '\0', exit loop
    sb $t4, 0($s1)           # Store byte from $t4 to new_buffer
    addi $s0, $s0, 1         # Move to next byte in buffer
    addi $s1, $s1, 1         # Move to next byte in new_buffer
    addi $s6, $s6, 1         # Increment counter
    
    beq $s6, $t3, end_copy_23_bytes  # If counter reaches 23, exit loop
    j copy_loop_23_bytes     # Repeat loop

end_copy_23_bytes:

    # Append new_test_result until '\0' to new_buffer (s1)
    la $s2, new_test_result      # Load address of new_test_result into $s2
    append_loop_new_test_result:
        lb $t4, 0($s2)           # Load byte from new_test_result into $t4
        beq $t4, $zero, test_result_updated  # If byte is '\0', exit loop
        sb $t4, 0($s1)           # Store byte from $t4 to new_buffer
        addi $s1, $s1, 1         # Move to next byte in new_buffer
        addi $s2, $s2, 1         # Move to next byte in new_test_result
        j append_loop_new_test_result  # Repeat loop

 test_result_updated :
    j skip_linee            # Branch to skip_linee after copying 23 bytes


end_copyy:
    # End of program
    

    # clear_buffer
    # Load the address of the buffer into a register
    la $t0, buffer
    
    # Set the number of bytes to clear
    li $t1, 2000
   
   jal clear_loop
   
   
   
   
   
#copy new_buffer to the buffer
   # Initialize registers
la $s0, new_buffer      # Load address of new_buffer into $s0
la $s1, buffer          # Load address of buffer into $s1

copy_loop_22:
    lb $t0, 0($s0)      # Load byte from new_buffer into $t0
    beq $t0, $zero, end_copy_loopp    # If byte is '\0', exit loop
    sb $t0, 0($s1)      # Store byte from $t0 to buffer
    addi $s0, $s0, 1    # Move to next byte in new_buffer
    addi $s1, $s1, 1    # Move to next byte in buffer
    j copy_loop_22        # Repeat loop

end_copy_loopp:
    # End of copying

  
            
# Find the length of the string
    la $s0, buffer           # move the address of buffer to $s0
    li $t1, 0                   # initialize counter to 0

loopppp:
    lb $t2, 0($s0)              # load byte from memory into $t2
    beq $t2, $zero, found_endd   # check if the byte is null terminator
    addi $s0, $s0, 1            # move to the next byte
    addi $t1, $t1, 1            # increment counter
    j loopppp                      # repeat the loop

found_endd:
    subi $s0, $s0, 1          # move back one byte (to last character before null terminator)
    lb $t4, 0($s0)              # load the last byte before null terminator into $t4

    # Check if the last byte is '\n'
    li $t2, '\n'                # load newline character
    beq $t4, $t2, replace_nn       # branch if the last byte is newline

    # Print the last byte
    li $v0, 11                  # syscall code for print character
    move $a0, $t4               # load the last byte into $a0
    syscall                     # print the last byte
    j exitt                      # skip replacement and exit

replace_nn:
    # Replace '\n' with '\0'
    li $t4, '\0'                # load null terminator
    sb $t4, 0($s0)              # store '\0' over '\n'
 


exitt:
    # Exit replacement


 
    
    
  # Open the output file for writing
li $v0, 13              # syscall code for open
la $a0, filename        # load address of file name
li $a1, 1               # open mode: write-only
li $a2, 0               # file permissions (not used in MARS)
syscall                 # open file

move $s0, $v0           # save file descriptor

# Calculate the length of buffer
li $t3, 0               # Initialize counter for length
la $t4, buffer      # Load address of new_buffer

count_lengthh:
    lb $t5, 0($t4)      # Load byte from new_buffer
    beq $t5, $zero, end_count_lengthh   # If byte is '\0', exit loop
    addi $t3, $t3, 1    # Increment counter
    addi $t4, $t4, 1    # Move to next byte in new_buffer
    j count_lengthh       # Repeat loop

end_count_lengthh:

# Write the contents of new_buffer to the output file
li $v0, 15              # syscall code for write
move $a0, $s0           # file descriptor
la $a1, buffer      # load address of new_buffer
move $a2, $t3           # length of new_buffer
syscall                 # write to file

# Close the output file
li $v0, 16              # syscall code for close
move $a0, $s0           # file descriptor
syscall                 # close file


# Prompt before update
    li $v0, 4           # syscall code for printing string
    la $a0, prompt_after  # load address of the prompt string
    syscall
    

move $t0, $k1

    # Call print_specific_line
    jal print_specific_line

   
    
   # clear_buffer
    # Load the address of the buffer into a register
    la $t0, new_buffer
    
    # Set the number of bytes to clear
    li $t1, 2000
   
   jal clear_loop
    
              

 

next_line_part5:
    
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
    j iterate_file_lines_part5

end_file_part5:


# Check if v1 is 1
beq $v1, 1, record_found  # If v0 is 1, branch to record_found

# If v1 is not 1, print message and ask to continue or return to menu
li $v0, 4                     # Print string syscall
la $a0, no_record_message     # Load address of message
syscall

# Ask to continue or return to menu
li $v0, 4                       # Print string syscall
la $a0, continue_or_return_menu # Load address of message
syscall

# Handle user input for continuing or returning to the menu

# Read user input
li $v0, 12        # Read integer syscall
syscall

move $v1, $v0     # Move user input to $v1

handle_input:
beq $v1, 99, update_test       # If the input is 'c' (ascii value 99), branch to update_test
beq $v1, 109, menu             # If the input is 'm' (ascii value 109), branch to menu


# If input is invalid, print message and ask again
li $v0, 4                          # Print string syscall
la $a0, invalid_input_message     # Load address of message
syscall


# Read user input again
li $v0, 12         # Read integer syscall
syscall
move $v1, $v0     # Move user input to $v1
j handle_input     # Jump back to handle user input

record_found:

# Print result updated successfully
li $v0, 4                        # Print string syscall
la $a0, updated_success_message # Load address of message
syscall

# Ask to continue or return to menu
li $v0, 4                      # Print string syscall
la $a0, continue_or_exit_menu # Load address of message
syscall

# Handle user input for continuing or exiting

# Read user input
li $v0, 12        # Read integer syscall
syscall

move $v1, $v0     # Move user input to $v1

handlee_inputt:
beq $v1, 99, update_test       # If the input is 'c' (ascii value 99), branch to update_test
beq $v1, 109, menu             # If the input is 'm' (ascii value 109), branch to menu


# If input is invalid, print message and ask again
li $v0, 4                          # Print string syscall
la $a0, invalid_input_message     # Load address of message
syscall


# Read user input again
li $v0, 12         # Read integer syscall
syscall
move $v1, $v0     # Move user input to $v1
j handlee_inputt     # Jump back to handle user input


 
 

delete_test:

 # Code to update test result
    
    
li $t9,0 #initialize t9 to store patient id input !!used

#----------------enter patient id ---------------------- 
    li $v0, 4            # Print string syscall
	la $a0, patient_id_prompt
	syscall
  # Call the function validate id to ask user about id and store it into t9
     jal validate_id
     
li $s4,0 #initialize s4 to be the address to store file test name
li $v1,0 #initialize v1 to for invalid (id+test type)
li $s6,0 #this used for loop 23 time
li $s7,0 #this used as a flag in compare section ( 1 -> string are equal)	
li $t5,0 #used to store test name from the user   !!used
li $t6,0 #initialize s7 to store second month input
li $k0,0 #used to store test name from the user   !!used
li $k1,0 #initialize s7 to store second month input


    
    
#----------------choose test name ---------------------- 
    
    
    
    #clear  test_name_chosen_by_user  
    # Load the address of the test_name_chosen_by_user   into a register
    la $t0, test_name_chosen_by_user  
    
    # Set the number of bytes to clear
    li $t1, 4
   
   jal clear_loop
   
   
  
  
  
    # Display the menu prompt
    li $v0, 4          # syscall code for print_string
    la $a0, prompt     # load address of prompt string
    syscall            # print the prompt
    
   

 enter_valid_option_delete:
    # Get user input
       li $v0, 12          # syscall code for reading character
    syscall

    la $t0, test_name_chosen_by_user  
    # Check the user's choice and store the corresponding test name
    beq $v0, 49, choice_1_del # If the choice is 1, jump to choice_1
    beq $v0, 50, choice_2_del # If the choice is 2, jump to choice_2
    beq $v0, 51, choice_3_del # If the choice is 3, jump to choice_3
    beq $v0, 52, choice_4_del # If the choice is 4, jump to choice_4
    j invalid_choiceee_del     # Otherwise, jump to invalid_choice

choice_1_del:
    

   # Store "Hemoglobin (Hgb)" into test_name_chosen_by_user
    li $t5, 'H'          # Load the ASCII value of 'H' into $t5
    sb $t5, 0($t0)       # Store 'H' into the memory location pointed by $t
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'g'          # Load the ASCII value of 'g' into $t5
    sb $t5, 0($t0)       # Store 'g' into the memory location pointed by $t0
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'b'          # Load the ASCII value of 'b' into $t5
    sb $t5, 0($t0)       # Store 'b' into the memory location pointed by $t0
    
    #----------------enter the date---------------------- 


#1. enter year
      
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_year
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k0, $t8          # Move the value of $t8 to $k0 --- year in k0

#2. enter month
# Prompt user for the first month
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_month
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k1, $t8          # Move the value of $t8 to $k1 --- month in k0

    j name_chosen_del        # Jump to end_program to terminate the program
    
    
    

choice_2_del:
    # Store "Blood Glucose Test (BGT)" into test_name_chosen_by_user

    li $t5, 'B'          # Load the ASCII value of 'H' into $t5
    sb $t5, 0($t0)       # Store 'H' into the memory location pointed by $t
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'G'          # Load the ASCII value of 'g' into $t5
    sb $t5, 0($t0)       # Store 'g' into the memory location pointed by $t0
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'T'          # Load the ASCII value of 'b' into $t5
    sb $t5, 0($t0)       # Store 'b' into the memory location pointed by $t0
    
    #----------------enter the date---------------------- 


 
#1. enter year
      
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_year
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k0, $t8          # Move the value of $t8 to $k0 --- year in k0

#2. enter month
# Prompt user for the first month
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_month
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k1, $t8          # Move the value of $t8 to $k1 --- month in k0
   

    j name_chosen_del        # Jump to end_program to terminate the program

choice_3_del:
    # Store "LDL Cholesterol (LDL)" into test_name_chosen_by_user
     # Store "Hemoglobin (Hgb)" into test_name_chosen_by_user
    li $t5, 'L'          # Load the ASCII value of 'H' into $t5
    sb $t5, 0($t0)       # Store 'H' into the memory location pointed by $t
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'D'          # Load the ASCII value of 'g' into $t5
    sb $t5, 0($t0)       # Store 'g' into the memory location pointed by $t0
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'L'          # Load the ASCII value of 'b' into $t5
    sb $t5, 0($t0)       # Store 'b' into the memory location pointed by $t0
    
    #----------------enter the date---------------------- 


#1. enter year
      
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_year
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k0, $t8          # Move the value of $t8 to $k0 --- year in k0

#2. enter month
# Prompt user for the first month
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_month
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k1, $t8          # Move the value of $t8 to $k1 --- month in k0
    
     
    j name_chosen_del         # Jump to end_program to terminate the program

choice_4_del:
    # Store "Blood Pressure Test (BPT)" into test_name_chosen_by_user
    # Store "Hemoglobin (Hgb)" into test_name_chosen_by_user
    li $t5, 'B'          # Load the ASCII value of 'H' into $t5
    sb $t5, 0($t0)       # Store 'H' into the memory location pointed by $t
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'P'          # Load the ASCII value of 'g' into $t5
    sb $t5, 0($t0)       # Store 'g' into the memory location pointed by $t0
    addi $t0, $t0, 1     # Increment the address in $t0

    li $t5, 'T'          # Load the ASCII value of 'b' into $t5
    sb $t5, 0($t0)       # Store 'b' into the memory location pointed by $t0
    
                #----------------enter the date---------------------- 


   
#1. enter year
      
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_year
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k0, $t8          # Move the value of $t8 to $k0 --- year in k0

#2. enter month
# Prompt user for the first month
subi $sp, $sp, 32      # Adjust stack pointer to make space for 8 registers (8 * 4 bytes = 32 bytes)

sw $a3, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
sw $t1, 8($sp)         # Save $t1
sw $t2, 12($sp)        # Save $t2
sw $t3, 16($sp)        # Save $t3
sw $t4, 20($sp)        # Save $t4
sw $t5, 24($sp)        # Save $t5
sw $t6, 28($sp)        # Save $t6

jal validate_month
lw $t6, 28($sp)        # Restore $t6
lw $t5, 24($sp)        # Restore $t5
lw $t4, 20($sp)        # Restore $t4
lw $t3, 16($sp)        # Restore $t3
lw $t2, 12($sp)        # Restore $t2
lw $t1, 8($sp)         # Restore $t1
lw $t0, 4($sp)         # Restore $t0
lw $a3, 0($sp)         # Restore $a3

addi $sp, $sp, 32      # Restore stack pointer to original position (optional)

move $k1, $t8          # Move the value of $t8 to $k1 --- month in k0
             

    
    j name_chosen_del       # Jump to end_program to terminate the program
    
    
    
    invalid_choiceee_del:
    # Display an error message for invalid choice
    li $v0, 4          # syscall code for print_string
    la $a0, invalid_choice_msg_for_test_type # load address of invalid_choice_msg string
    syscall            # print the error message
    j enter_valid_option_delete            # Go back to the main menu

 

name_chosen_del:


#---------------test_name_chosen_by_user  ready to use------------------


#-----------------------start with  searching about line contains id=id , name=name to update its result ---------------------------         
        
   # Load the address of the buffer into $a3
    la $a3, buffer
    
    # Initialize index for storing IDs in the array
    li $t0, 0
    
    li $t3, 0x3A    # ASCII value for ':
     
    
    # Initialize the flag register (this to make sure if the id stored to go to the next id
    li $t7, 0
    
     li $a1, 0
     
     
       li $t4, 0
     
        move $t0, $zero # $t0 is now zero
mult $t0, $zero # the result of the multiplication is zero, stored in `lo` and `hi`
mflo $31       # move the result from `lo` to `lo`, this is effectively a reset

    
iterate_file_lines_part6:

#-----------------------------------
#start reading id in each line :
#-----------------------------------
   
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    # Check if the byte is null terminator '\0'
    beq $a1, $zero, end_file_part6  # If null terminator found, end parse loop
    
    
    # Check if flag t7 is 0 ; if it is 0 then extract the id  by going to continue_parsing  and then check if it is equal to the input id
    #if it is 1  go to the next line to extract new id 
    beq $t7, $zero, combine_id_part6
    
    
    
    
    # Walk in the buffer until "\n" is found
skip_till_newline_part6:
    # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    # Check if the byte is null terminator '\0'
    beq $a1, $zero, end_file_part6   # If null terminator found, end parse loop
    
    
    # Check if the byte is newline character '\n'
    li $t8, 0x0A    # ASCII value for '\n'
    beq $a1, $t8, reset_flag_to_compine_new_id_part6    # If newline found, reset flag and continue parsing
    
    # Move to the next byte in the buffer
    addi $a3, $a3, 1
    
    j skip_till_newline_part6

reset_flag_to_compine_new_id_part6:
    # Reset flag t7
    li $t7, 0
    
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    # Check if the byte is null terminator '\0'
    beq $a1, $zero, end_file_part6  # If null terminator found, end parse loop
    
    # Continue parsing loop
    j iterate_file_lines_part6

combine_id_part6:
    # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    # Check if the byte is a digit or a (:) colon
    li $t1, 0x30    # ASCII value for '0'
    beq $a1, $t3, the_id_is_in_t4_part6
    

    
    blt $a1, $t1, next_byte_part6
    
    # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t4, $t4, 10   # Multiply current ID by 10
    add $t4, $t4, $a1  # Add new digit to ID
    
    # Move to the next byte in the buffer
    addi $a3, $a3, 1
    
    # Repeat the loop
    j iterate_file_lines_part6

next_byte_part6:
    # Move to the next byte in the buffer
    addi $a3, $a3, 1
    
    # Repeat the loop
    j iterate_file_lines_part6
    
  
    
the_id_is_in_t4_part6:

    #brint the line if the id = user input
      beq $t4, $t9, desired_id_part6     # Branch to equal_branch if $t4 is equal to $t9
    # Code to execute if $t4 is not equal to $t9
    j next_line_part6             # Jump to next_instruction

desired_id_part6 :

#-----------------------------------
#extract the test name  ( test name = input test name then go to the update result part)
#-----------------------------------

# Save register values onto the stack
subi $sp, $sp, 20      # Adjust stack pointer to make space for 5 registers (5 * 4 bytes = 20 bytes)

sw $t1, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0


 # clear_test_name_from_file 
    # Load the address of the buffer into a register
    la $t0, test_name_from_file  
    
    # Set the number of bytes to clear
    li $t1, 4
   
   jal clear_loop

# Restore register values from the stack

lw $t0, 4($sp)         # Restore $t0
lw $t1, 0($sp)         # Restore $a3


   
la $s4, test_name_from_file # Load the address of test_name into $s4

# Move to the test name byte in the buffer
addi $a3, $a3, 2
# Load a byte from memory into $a1
lb $a1, 0($a3)
sb $a1, 0($s4)  # Store $a1 at the memory location pointed by $s4
addi $s4, $s4, 1  # Increment the address in $s4

addi $a3, $a3, 1
# Load a byte from memory into $a1
lb $a1, 0($a3)
sb $a1, 0($s4)  # Store $a1 at the memory location pointed by $s4
addi $s4, $s4, 1  # Increment the address in $s4

addi $a3, $a3, 1
# Load a byte from memory into $a1
lb $a1, 0($a3)
sb $a1, 0($s4)  # Store $a1 at the memory location pointed by $s4
    
   


# Load addresses of the strings into registers
    la $s4, test_name_from_file         # Address of test_name_from_file
    la $v1, test_name_chosen_by_user    # Address of test_name_chosen_by_user
# Save register values onto the stack
subi $sp, $sp, 20      # Adjust stack pointer to make space for 5 registers (5 * 4 bytes = 20 bytes)

sw $t1, 0($sp)         # Save $a3
sw $t0, 4($sp)         # Save $t0
 # Call the string comparison subroutine
    jal cmploop
    
# Restore register values from the stack

lw $t0, 4($sp)         # Restore $t0
lw $t1, 0($sp)         # Restore $a3

    
      # At this point, the result of the comparison is in $s7
    # Print appropriate message based on the result


    beq $s7, 1, equal_strings_delete_result          # If $v0 is 1, strings are equal

    j next_line_part6 #not equal                      # Jump to end_program to terminate the program



equal_strings_delete_result:

 # Reset $t5, t6 for each line
    li $t5, 0
    li $t6, 0
    
   # Move to the year byte in the buffer
    addi $a3, $a3, 3
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t5, $t5, 10   # Multiply current ID by 10
    add $t5, $t5, $a1  # Add new digit to ID
    
    
  
    # Move to the next byte in the buffer
    addi $a3, $a3, 1
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t5, $t5, 10   # Multiply current ID by 10
    add $t5, $t5, $a1  # Add new digit to ID
    
 
 # Move to the next byte in the buffer
    addi $a3, $a3, 1
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t5, $t5, 10   # Multiply current ID by 10
    add $t5, $t5, $a1  # Add new digit to ID
    
     # Print the content of $t5
    li $v0, 1           # System call for print integer
    move $a0, $t5       # Move the content of $t4 to $a0 for printing
    syscall

    # Print new line
    li $v0, 4           # System call for print string
    la $a0, newline     # Load the address of the new line string
    syscall
    
    
     # Move to the next byte in the buffer
    addi $a3, $a3, 1
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
  
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t5, $t5, 10   # Multiply current ID by 10
    add $t5, $t5, $a1  # Add new digit to ID
    
   
    
#---------------------year is ready---------------------------
    
     # Move to the year byte in the buffer
    addi $a3, $a3, 2
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t6, $t6, 10   # Multiply current ID by 10
    add $t6, $t6, $a1  # Add new digit to ID
    
    
      
     # Move to the year byte in the buffer
    addi $a3, $a3, 1
     # Load a byte from memory into $a1
    lb $a1, 0($a3)
    
    
     # Convert ASCII digit to integer and add to ID
    sub $a1, $a1, $t1  # Convert ASCII to integer
    mul $t6, $t6, 10   # Multiply current ID by 10
    add $t6, $t6, $a1  # Add new digit to ID
    
    
 
    
#---------------------month is also ready---------------------------

# Check if k0 = t5 and k1 = t6
beq $k0, $t5, check_k1_del
j next_line_part6

check_k1_del:
    beq $k1, $t6, continue_to_delete
    j next_line_part6



continue_to_delete:
 # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, dashes_prompt
    syscall
 
   
    # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, before_delete_success_message
    syscall
    
    
       # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, dashes_prompt
    syscall
    
    
      jal readtestFile      # Call the readtestFile function
   
    
   
   
li $v1,1


 # Initialize registers
    la $s0, buffer      # Load address of buffer into $s0
    la $s1, new_buffer  # Load address of new_buffer into $s1
    la $t1, newline    # Load address of newline string
    lb $t1, 0($t1)     # Load byte (newline character) into $t1
    li $t2, 0           # Initialize counter $t2 to 0 to count \n
    li $k0, 0           # Initialize counter $t2 to 0 to count \n
    
copy_loop:
    beq $t0 , $zero , skip_line   # this to delete the first line and continue copying others
    end_skip_line:
    continue_copying:
    lb $k0, 0($s0)      # Load byte from buffer into $t0
    beq $k0, $zero, end_copy  # If byte is '\0', exit loop
     # Check if the byte is '\n'
 
    
    sb $k0, 0($s1)      # Store byte from $t0 to new_buffer
    addi $s0, $s0, 1    # Move to next byte in buffer
    addi $s1, $s1, 1    # Move to next byte in new_buffer
    beq $k0, $t1, increment_counter  # If byte is '\n', increment counter
    
    j continue_copying        # Repeat loop
    
 #if t0 = 0 (first line) skep until first \n   
skip_line:

    lb $k0, 0($s0)      # Load byte from buffer into $t0
    beq $k0, $zero, end_copy  # If byte is '\0', exit function
    addi $s0, $s0, 1    # Move to next byte in buffer
    # If byte is '\n', exit function
    beq $k0, $t1, end_skip_line
    # If not '\n', continue skipping characters
 
    j skip_line         # Repeat loop
    
    
  increment_counter:
    addi $t2, $t2, 1    # Increment counter
    
    beq $t0 , $t2 , skip_line # this for check the line number according t0 \n (t2) value 
    # if t0 = 1 then skip second line
    # if t0 = 2 then skip thir line
    j continue_copying         # Repeat loop


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
la $s0, new_buffer      # Load address of new_buffer into $s0
la $s1, buffer          # Load address of buffer into $s1

copy_loop_2:
    lb $t0, 0($s0)      # Load byte from new_buffer into $t0
    beq $t0, $zero, end_copy_loop    # If byte is '\0', exit loop
    sb $t0, 0($s1)      # Store byte from $t0 to buffer
    addi $s0, $s0, 1    # Move to next byte in new_buffer
    addi $s1, $s1, 1    # Move to next byte in buffer
    j copy_loop_2        # Repeat loop

end_copy_loop:
    # End of copying

  
            
# Find the length of the string
    la $s0, buffer           # move the address of buffer to $s0
    li $t1, 0                   # initialize counter to 0

loop:
    lb $t2, 0($s0)              # load byte from memory into $t2
    beq $t2, $zero, found_end   # check if the byte is null terminator
    addi $s0, $s0, 1            # move to the next byte
    addi $t1, $t1, 1            # increment counter
    j loop                      # repeat the loop

found_end:
    subi $s0, $s0, 1          # move back one byte (to last character before null terminator)
    lb $t4, 0($s0)              # load the last byte before null terminator into $t4

    # Check if the last byte is '\n'
    li $t2, '\n'                # load newline character
    beq $t4, $t2, replace_n       # branch if the last byte is newline

    # Print the last byte
    li $v0, 11                  # syscall code for print character
    move $a0, $t4               # load the last byte into $a0
    syscall                     # print the last byte
    j exit                      # skip replacement and exit

replace_n:
    # Replace '\n' with '\0'
    li $t4, '\0'                # load null terminator
    sb $t4, 0($s0)              # store '\0' over '\n'
 


exit:
    # Exit replacement

   
  # Open the output file for writing
li $v0, 13              # syscall code for open
la $a0, filename        # load address of file name
li $a1, 1               # open mode: write-only
li $a2, 0               # file permissions (not used in MARS)
syscall                 # open file

move $s0, $v0           # save file descriptor

# Calculate the length of buffer
li $t3, 0               # Initialize counter for length
la $t4, buffer      # Load address of new_buffer

count_length:
    lb $t5, 0($t4)      # Load byte from new_buffer
    beq $t5, $zero, end_count_length   # If byte is '\0', exit loop
    addi $t3, $t3, 1    # Increment counter
    addi $t4, $t4, 1    # Move to next byte in new_buffer
    j count_length       # Repeat loop

end_count_length:

# Write the contents of new_buffer to the output file
li $v0, 15              # syscall code for write
move $a0, $s0           # file descriptor
la $a1, buffer      # load address of new_buffer
move $a2, $t3           # length of new_buffer
syscall                 # write to file

# Close the output file
li $v0, 16              # syscall code for close
move $a0, $s0           # file descriptor
syscall                 # close file


 # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, dashes_prompt
    syscall
 
   
    # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, after_delete_success_message
    syscall
    
    
       # Prompt user for medical data
    li $v0, 4            # Print string syscall
    la $a0, dashes_prompt
    syscall
    
    
      jal readtestFile      # Call the readtestFile function
   
    
   

   # clear_buffer
    # Load the address of the buffer into a register
    la $t0, new_buffer
    
    # Set the number of bytes to clear
    li $t1, 2000
   
   jal clear_loop
    
              



next_line_part6:
    
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
    j iterate_file_lines_part6

end_file_part6:


# Check if v1 is 1
beq $v1, 1, record_found_part6  # If v0 is 1, branch to record_found

# If v1 is not 1, print message and ask to continue or return to menu
li $v0, 4                     # Print string syscall
la $a0, no_record_message     # Load address of message
syscall

# Ask to continue or return to menu
li $v0, 4                       # Print string syscall
la $a0, continue_or_return_menu# Load address of message
syscall

# Handle user input for continuing or returning to the menu

# Read user input
li $v0, 12        # Read integer syscall
syscall
move $v1, $v0     # Move user input to $v1

handle_input_delete:
beq $v1, 99, delete_test       # If the input is 'c' (ascii value 99), branch to update_test
beq $v1, 109, menu             # If the input is 'm' (ascii value 109), branch to menu


# If input is invalid, print message and ask again
li $v0, 4                          # Print string syscall
la $a0, invalid_input_message     # Load address of message
syscall

# Ask for input again
li $v0, 4                       # Print string syscall
la $a0, continue_or_return_menu # Load address of message
syscall

# Read user input again
li $v0, 12         # Read integer syscall
syscall
move $v1, $v0     # Move user input to $v1
j handle_input_delete     # Jump back to handle user input

record_found_part6:

# Print result updated successfully
li $v0, 4                        # Print string syscall
la $a0, delete_success_message # Load address of message
syscall

# Ask to continue or return to menu
li $v0, 4                      # Print string syscall
la $a0, continue_or_exit_menu # Load address of message
syscall

# Handle user input for continuing or exiting

# Read user input
li $v0, 12        # Read integer syscall
syscall
move $v1, $v0     # Move user input to $v1

beq $v1, 99, delete_test       # If the input is 'c' (ascii value 99), branch to update_test
beq $v1, 109, menu     # If the input is 'e' (ascii value 101), branch to exit_program



     
 # string compare loop (just like strcmp)
cmploop:

# Initialize s7 as a flag
li      $s7, 1


    lb      $t0,($s4)                   # get next char from str1
    lb      $t1,($v1)                   # get next char from str2
    bne     $t0,$t1,cmpne               # are they different? if yes, fly

    beq     $t0,$zero,cmpeq             # at EOS? yes, fly (strings equal)

    addi    $s4,$s4,1                   # point to next char
    addi    $v1,$v1,1                   # point to next char
    j       cmploop

# strings are _not_ equal -- send message
cmpne:

     li      $s7, 0                         # set s7 to 0
    jr      $ra

# strings _are_ equal -- send message
cmpeq:

  jr      $ra

end_programm:
 # Exit program
        li $v0, 10              # syscall code for exit
        syscall
        
        
 ########################################
 
 
 
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


find_semicoloonn:

    lb $t0, 0($a0)        # Load the next character from the input string into $t0
    beq $t0, ':', determine_test_name # If colon, check if ID matches
    li $t1, ','           # Load the ASCII value of semicolon into $t1
    beq $t0, $t1, increment_counterrr # If the current character is a semicolon, increment the counter
    addiu $a0, $a0, 1     # Move to the next character in the input string
    j find_semicoloonn      # Jump back to the start of the loop

increment_counterrr:
    addiu $t2, $t2, 1     # Increment the semicolon counter
    addiu $a0, $a0, 1     # Move past the semicolon
    li $t3, 2             # We're looking for the second semicolon
    beq $t2, $t3, copy_testName # If we've found two semicolons, start copying
    j find_semicoloonn      # Otherwise, keep looking for semicolons

copy_testName:

    lb $t0, 0($a0)        # Load the next character from the input string into $t0
    beq $t0, ' ', skipTHESpace # Check for the space character
    beq $t0, '\n', ENDofLine # Check for the end of the line
    beq $t0, '\0', ENDofLine # Check for the end of the line

    sb $t0, 0($a1)        # Store the character in the output string
    beq $t0, '/', BPT_handel # If backslash, jump to BPT_handel
    addiu $a0, $a0, 1     # Move to the next character in the input string
    addiu $a1, $a1, 1     # Move to the next position in the output string
    j copy_testName       # Jump back to the start of the copy loop

skipTHESpace:
    addiu $a0, $a0, 1     # Move to the next character in the input string
   j copy_testName

 BPT_handel: 
             # just add \n to this byte where \ is exist
                li $t1, 0x0a          # ASCII value of '\n'
                sb $t1, 0($a1)        # Add a '\n' to the output string
                addiu $a0, $a0, 1     # Move to the next character in the input string
                la $a1, outputString2
                j copy_testName


# -----------------------------------Get return uniqe value in t4 according to the test name-------------------------------- 


 determine_test_name: 
  li $t3, 0 # rest the value of asscii sum. 

 GetUniqeValueOfTestName:

  addiu $a0, $a0, 1      # Skip the : character
  lb $t0, 0($a0)        # Load the next character from the input string into $t0
  beq $t0, ' ', GetUniqeValueOfTestName # Check for the end of the string
  
  # sum the ascii values of the test name to choose the test value to calculate the average
    beq $t0, ',', extractTestType # If colon, have unique value for each test name 
    addu $t3, $t3, $t0     # Add the ASCII value to the sum for test name comparison
    
    jal GetUniqeValueOfTestName

    #beq $t0, '\0', extractTestType # If colon, have unique value for each test name 
extractTestType:

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
        addiu $a0, $a0, 1 
        j find_semicoloonn

    BGT_test:
        li $t4, 2
        addiu $s2, $s2, 1
        addiu $a0, $a0, 1 
        j find_semicoloonn

    LDL_test:
        li $t4, 3
        addiu $s3, $s3, 1
        addiu $a0, $a0, 1
        j find_semicoloonn

    BPT_test:
        li $t4, 4
        addiu $s4, $s4, 1
        addiu $a0, $a0, 1
        j find_semicoloonn    

#-----------------------------------end of Get return uniqe value in t4 according to the test name------------------------


ENDofLine:

           li $t2,0 # rest the value of t2 to 0  for string2.
            move $t7, $a0          # save the start of the next line
            sb $t0, 0($a1)        # Store \n in the output string for use it for termination


            #loop to check outupt string if it has dot or not

          la $a0, outputString
          check_dot:
                    lb $t0, 0($a0)        # Load the next character from the output string into $t0
                    beq $t0, '.', dot_found # If dot, jump to dot_found
                    beq $t0, '\n', no_dot_found # If newline, jump to no_dot_found
                    beq $t0, '\0', no_dot_found # If newline, jump to no_dot_found
                    
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
                   

              dot_found:  
                     bne $t4, 4, skip_this_no_need
                     beq $t2, 1, skip_this_no_need  #flag to not check the dot again

                     # use t2 for terminate the string2 
                     #store in t2 the value 1  to not make the loop to check the dot again
                        li $t2, 1
                        la $a0, outputString2   # Load address of the output string into $a0
                        j check_dot


                skip_this_no_need:
           
            
           
            beq $t4, 1, Hgb_test_type
            beq $t4, 2, BGT_test_type
            beq $t4, 3, LDL_test_type
            beq $t4, 4, BPT_test_type

            Hgb_test_type:
                        la $a0, outputString   # Load address of the output string into $a0
                        jal parseeString        # Jump to the string parsing function
                        jal convertPartsToFloatAndPrint
                        # f1 will have the float value of the test result
                        j doneConvertion


            BGT_test_type:
                        la $a0, outputString   # Load address of the output string into $a0
                        jal parseeString        # Jump to the string parsing function
                        jal convertPartsToFloatAndPrint
                        # f1 will have the float value of the test result
			            j doneConvertion            


            LDL_test_type:
                        la $a0, outputString   # Load address of the output string into $a0
                        jal parseeString        # Jump to the string parsing function
                        jal convertPartsToFloatAndPrint
                        # f1 will have the float value of the test result
                        j doneConvertion	
                        		
            BPT_test_type: 
                        la $a0, outputString   # Load address of the output string into $a0
                        jal parseeString        # Jump to the string parsing function
                        jal convertPartsToFloatAndPrint
                        mov.s $f5 , $f1

                        la $a0, outputString2 
                        jal parseeString        # Jump to the string parsing function
                        jal convertPartsToFloatAndPrint
                        
                        # f1 will have the float value of the test result


doneConvertion:

                move $ra, $t8 # restore the return address
                addiu $t7, $t7, 1 # Move to the next line 
                move $a0, $t7    # Move to the next line stored in a0 as return value
                li $t2, 0              # Reset the sum for next ID
                lb $a1, 0($a0)
                beq $a1, '\0', buffer_done # Check for end of buffer
                li $s7, 0 # set the value of s6 to 0 to indicate that th e buffer is not done.
                jr $ra

                buffer_done:
                li $s7, 1 # set the value of s6 to 1 to indicate that the buffer is done
                jr $ra
               


#-------------------------------------string to float conversion --------------------------------------------

parseeString:
    # Initialize variables
    li $t1, 0              # Will hold the integer part
    li $t2, 0              # Will hold the fractional part
    li $t3, 1              # Will be used for the scale
    
    
    # Parse the integer part
parseInteger:
    lb $t0, 0($a0)         # Load the next byte (character) from the string
    beq $t0, '.', endInteger # Check for decimal point    
     beq $t0, '\0', no_value
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
    
    beq $t0,'\0',endFractional
    
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
    
    
    no_value:
    jr $ra                 # Return
	
#---------------------------------------End of string to float conversion--------------------------------------------

#---------------------------------------End of Function which returns the type of the test--------------


       
      
validate_id:

reenter_id:



# Save register values onto the stack
subi $sp, $sp, 20      # Adjust stack pointer to make space for 5 registers (5 * 4 bytes = 20 bytes)

sw $ra, 0($sp)         # Save $a3


 # clear_test_name_from_file 
    # Load the address of the buffer into a register
    	la $t0, patient_id  
    
    # Set the number of bytes to clear
	li $t1, 10
   
	jal clear_loop

lw $ra, 0($sp)         # Restore $ra
# validate patient id




 li $v0, 8            # Read string syscall
    la $a0, patient_id
    li $a1, 20           # Maximum length of patient ID
    syscall
	
	# Initialize counter
	li $t4, 0    # Counter for string length

# Load the address of the patient ID string into $t5
	la $t5, patient_id

# Load desired length into $t6
	li $t6, 7    # Desired length 7 

# Loop to count characters until null terminator
loop_id_length:
    lb $t3, 0($t5)   # Load byte from address $t5 into $t3
    
        beq $t3, 10, end      # If t3 is newline (ASCII code 10), jump to end

     blt $t3, 48, not_asci      # If t3 is less than 48 ('0'), jump to end
    bgt $t3, 57, not_asci      # If t3 is greater than 57 ('9'), jump to end
    
    
    addi $t5, $t5, 1 # Increment address to next character
    addi $t4, $t4, 1 # Increment counter for string lengt
    j  loop_id_length # Continue loop if length is not yet 7
    

end:
    # At this point, $t4 contains the length of the string
    # If $t4 equals 7, the length is correct
    # If $t4 is not 7, the length is not correct
 
     beq $t4, $t6, id_is_valid  # If length is 7, check if all digits are integers
     not_asci:
     li $v0, 4            # Print string syscall
      la $a0, invalid_patient_id_msg
	syscall
     j reenter_id                      # Otherwise, jump back to enter again
     

id_is_valid:

# Convert patient id string to integer
li $t9, 0            # Initialize $t9 to store the integer representation of patient id

# Load the address of the patient ID string into $t5
la $t5, patient_id

# Loop to traverse the patient ID string
loop_convert_to_int:
    lb $t3, 0($t5)   # Load byte from address $t5 into $t3

    # Check if the current character is the null terminator
    beq $t3, 10, end_conversion  # If it is, terminate the loop
    
    # Convert ASCII digit to integer and update $t9
    sub $t3, $t3, 48     # Convert ASCII digit to integer
    mul $t9, $t9, 10     # Multiply existing value by 10 to shift digits
    add $t9, $t9, $t3    # Add current digit to $t9

    addi $t5, $t5, 1     # Move to the next character
    j loop_convert_to_int  # Continue loop

end_conversion:

li $t5,0


jr $ra






validate_year:

# Prompt user for month
li $v0, 4
la $a0, year_prompt
syscall

reenter_year:



move $a0, $ra          # Move the value of $ra to $a0


 # clear_test_name_from_file 
    # Load the address of the buffer into a register
    	la $t0, year_buffer 
    
    # Set the number of bytes to clear
	li $t1, 10
   
	jal clear_loop

move $ra, $a0         # Move the value of $ra to $a0


 li $v0, 8
la $a0, year_buffer
li $a1, 6           # Maximum length of year
syscall

	
	# Initialize counter
	li $t4, 0    # Counter for string length

# Load the address of the patient ID string into $t5
	la $t5, year_buffer

# Load desired length into $t6
	li $t6, 4    # Desired length 7 

# Loop to count characters until null terminator
loop_year_length:
    lb $t3, 0($t5)   # Load byte from address $t5 into $t3
    
        beq $t3, 10, end_year      # If t3 is newline (ASCII code 10), jump to end

     blt $t3, 48, not_asci_year     # If t3 is less than 48 ('0'), jump to end
    bgt $t3, 57, not_asci_year      # If t3 is greater than 57 ('9'), jump to end
    
    
    addi $t5, $t5, 1 # Increment address to next character
    addi $t4, $t4, 1 # Increment counter for string lengt
    j  loop_year_length # Continue loop if length is not yet 7
    

end_year:
    # At this point, $t4 contains the length of the string
    # If $t4 equals 7, the length is correct
    # If $t4 is not 7, the length is not correct
 
     beq $t4, $t6, year_is_valid  # If length is 7, check if all digits are integers
     not_asci_year:
     li $v0, 4            # Print string syscall
      la $a0, invalid_patient_year_msg
	syscall
     j reenter_year                      # Otherwise, jump back to enter again
     

year_is_valid:

# Convert patient id string to integer
li $t8, 0            # Initialize $t9 to store the integer representation of patient id
li $t3, 0            # Initialize $t9 to store the integer representation of patient id
# Load the address of the patient ID string into $t5
la $t5, year_buffer

# Loop to traverse the patient ID string
loop_convert_year_to_int:
    lb $t3, 0($t5)   # Load byte from address $t5 into $t3

    # Check if the current character is the null terminator
    beq $t3, 10, end_conversion_year  # If it is, terminate the loop
    
    # Convert ASCII digit to integer and update $t9
    sub $t3, $t3, 48     # Convert ASCII digit to integer
    mul $t8, $t8, 10     # Multiply existing value by 10 to shift digits
    add $t8, $t8, $t3    # Add current digit to $t9

    addi $t5, $t5, 1     # Move to the next character
    j loop_convert_year_to_int  # Continue loop

end_conversion_year:

li $t5,0

jr $ra


validate_month:

reenter_month:

# Prompt user for month
li $v0, 4
la $a0, month_prompt
syscall

move $a0, $ra          # Move the value of $ra to $a0

 # clear_test_name_from_file 
    # Load the address of the buffer into a register
    	la $t0, month_buffer 
    
    # Set the number of bytes to clear
	li $t1, 10
   
	jal clear_loop

move $ra, $a0          # Move the value of $ra to $a0

 li $v0, 8
la $a0, month_buffer
li $a1, 4           # Maximum length of year
syscall

	
	# Initialize counter
	li $t4, 0    # Counter for string length

# Load the address of the patient ID string into $t5
	la $t5, month_buffer

# Load desired length into $t6
	li $t6, 2    # Desired length 7 

# Loop to count characters until null terminator
loop_month_length:
    lb $t3, 0($t5)   # Load byte from address $t5 into $t3
    
        beq $t3, 10, end_month      # If t3 is newline (ASCII code 10), jump to end

     blt $t3, 48, not_asci_month     # If t3 is less than 48 ('0'), jump to end
    bgt $t3, 57, not_asci_month      # If t3 is greater than 57 ('9'), jump to end
    
    
    addi $t5, $t5, 1 # Increment address to next character
    addi $t4, $t4, 1 # Increment counter for string lengt
    j  loop_month_length # Continue loop if length is not yet 7
    

end_month:
    # At this point, $t4 contains the length of the string
    # If $t4 equals 7, the length is correct
    # If $t4 is not 7, the length is not correct
 
     beq $t4, $t6, month_is_valid  # If length is 7, check if all digits are integers
     not_asci_month:
     li $v0, 4            # Print string syscall
      la $a0, invalid_patient_month_msg
	syscall
     j reenter_month                      # Otherwise, jump back to enter again
     

month_is_valid:

# Convert patient id string to integer
li $t8, 0            # Initialize $t9 to store the integer representation of patient id
li $t3, 0 
# Load the address of the patient ID string into $t5
la $t5, month_buffer

# Loop to traverse the patient ID string
loop_convert_month_to_int:
    lb $t3, 0($t5)   # Load byte from address $t5 into $t3

    # Check if the current character is the null terminator
    beq $t3, 10, end_conversion_month  # If it is, terminate the loop
    
    # Convert ASCII digit to integer and update $t9
    sub $t3, $t3, 48     # Convert ASCII digit to integer
    mul $t8, $t8, 10     # Multiply existing value by 10 to shift digits
    add $t8, $t8, $t3    # Add current digit to $t9

    addi $t5, $t5, 1     # Move to the next character
    j loop_convert_month_to_int  # Continue loop

end_conversion_month:

blt $t8, 1, not_asci_month     # If month is less than or equal to 12, continue
bgt $t8, 12, not_asci_month      # If month is less than or equal to 12, continue
li $t5,0

jr $ra




validate_result:
reenter_result:
   

    move $a0, $ra          

    # Clear the buffer 
    la $t0, test_result 
    li $t1, 10
    jal clear_loop

    move $ra, $a0          

    li $v0, 8
    la $a0, test_result 
    li $a1, 8
    syscall

     

    # Load the address of the result string into $t5
    la $t5, test_result 

  li $t1, 46            # ASCII value of the dot character ('.')

loop_result_length:
    lb $t3, 0($t5)   

    beq $t3, 10, end_result     

    beq $t3, $t1, skip_processing    # Branch if $t3 contains the ASCII value of '.'
    blt $t3, 48, not_valid_result     
    bgt $t3, 57, not_valid_result   
    skip_processing  :   
    
    addi $t5, $t5, 1  
    j loop_result_length 
        
        not_valid_result :
         li $v0, 4            # syscall code for printing a string
   	 la $a0, result_prompt_numeric  # load the address of the prompt message into $a0
    	syscall              # execute the syscall
        j reenter_result                    

end_result  :
    jr $ra


search_unnormal_tests_by_input_test :



                #-----------------------------------Selecting the test name--------------------------------
                   #promt
                    li $v0, 4
                    la $a0, prompt
                    syscall

                    # Read user's choice
                    li $v0, 5
                    syscall
                    move $t0, $v0  # Move user's choice into $t0

                    # Compare user's choice and jump to the corresponding procedure

                    li $t1, 1
                    beq $t0, $t1, hemoglobin_label_test_value_unnormal

                    li $t1, 2
                    beq $t0, $t1, blood_glucose_test_label_test_value_unnormal

                    li $t1, 3
                    beq $t0, $t1, ldl_cholesterol_label_test_value_unnormal

                    li $t1, 4
                    beq $t0, $t1, blood_pressure_test_label_test_value_unnormal

                  
                    # If invalid option, show error and go back to menu
                    li $v0, 4
                    la $a0, invalid_input_message
                    syscall
                    j search_unnormal_tests_by_input_test

                    # load the valu of each test name in user_test_new_value

                    hemoglobin_label_test_value_unnormal:
                    li $t1, 0x111        # ASCII sum for "Hgb"
                    sw $t1, user_test_new_value
                    j goto_unnormal
                          
                    
                    blood_glucose_test_label_test_value_unnormal:
                    li $t1, 0xDD         # ASCII sum for "BGT"
                    sw $t1, user_test_new_value
                    j goto_unnormal
                           
                    ldl_cholesterol_label_test_value_unnormal: 
                    li $t1, 0xDC         # ASCII sum for "LDL"
                    sw $t1, user_test_new_value
                    j goto_unnormal
                    
                    blood_pressure_test_label_test_value_unnormal:
                    li $t1, 0xE6         # ASCII sum for "BPT"
                    sw $t1, user_test_new_value
                          
             goto_unnormal: 
                   
                #load the buffer address
                la $a0, buffer # Load the address of the buffer into $a0
                li $s7, 0 # Initialize the flag to 0
		

            check_file_test_name_unnormal:

                 move $t9, $a0 # Save the address of the start of the buffer in $t7
                
                 li $t5, 0 # reset the value of t5 to 0
                 jal boolTestNameCheck # f(a0 , user_test_new_value) return equal if t5=1 else not.
                 beq $t5, 1, printResult_line_if_unnormal # if t5 = 0 mean the test name is not equal to the user_test_new_value if t5 = 1 mean the test name is equal to the user_test_new_value


	 	         move $a0, $t9
                 jal gotoNEXTline
                 beq $s7, 1, check_founded_test_name_unnormal
                 j check_file_test_name_unnormal



            printResult_line_if_unnormal:
               
    
            move $a0, $t9          # Load the address of the start of the line into $a0
            jal line_test_values # f(a0) retrun F1 = test result in floating point, t4 = type of test, a0 = start of the next line

            #-----------------------------------sum the values of the test result to calculate the average--------------------------------
            
            beq $t4, 1, Hgb_test_unnormal_test_name
            beq $t4, 2, BGT_test_unnormal_test_name
            beq $t4, 3, LDL_test_unnormal_test_name
            beq $t4, 4, BPT_test_unnormal_test_name


            Hgb_test_unnormal_test_name:

                            lwc1 $f3, lowerBoundHgb # Load the lower bound value, which is 13.8
                            lwc1 $f4, upperBoundHgb # Load the upper bound value, which is 17.2

                            c.lt.s $f1, $f3         # Compare the test result in $f1 with the lower bound $f3
                            bc1t printIfUnnormalByTestName   # If the test result is less than the lower bound, branch to if_it_unnormal

                            c.lt.s $f4, $f1         # Compare the test result in $f1 with the upper bound $f4
                            bc1t printIfUnnormalByTestName   # If the test result is greater than the upper bound, branch to if_it_unnormal

                            
                            beq $s7, 1, check_founded_test_name_unnormal  # If the end of the file is reached, return to the menu
                            j check_file_test_name_unnormal       # Continue to check file IDs							
                                                        
                                    
                    
            BGT_test_unnormal_test_name:

                           lwc1 $f3, lowerBoundBGT # Load the lower bound value is 70.0
                           lwc1 $f4, upperBoundBGT # Load the upper bound value is 99.0

                           c.lt.s $f1, $f3         # Compare the test result in $f1 with the lower bound $f3
                           bc1t printIfUnnormalByTestName   # If the test result is less than the lower bound, branch to if_it_unnormal

                           c.lt.s $f4, $f1         # Compare the test result in $f1 with the upper bound $f4
                           bc1t printIfUnnormalByTestName   # If the test result is greater than the upper bound, branch to if_it_unnormal
                           

                           beq $s7, 1, check_founded_test_name_unnormal
                           j  check_file_test_name_unnormal                                        

            LDL_test_unnormal_test_name:

 
                            lwc1 $f4, upperBoundLDL  # Load the upper bound value of 100.0 into $f3
                            c.le.s $f4, $f1          # Compare the test result in $f1 with the upper bound in $f3
                            bc1t printIfUnnormalByTestName    # If $f1 is not less than or equal to $f3 (i.e., $f1 is greater than $f3), branch to end_findNextLine
                           
                            beq $s7, 1, check_founded_test_name_unnormal
                            j  check_file_test_name_unnormal         
                        		
            BPT_test_unnormal_test_name: 

                            lwc1 $f4, upperBoundSystolicBPT # Load the upper bound value is 120.0
                            lwc1 $f3, upperBoundDiastolicBPT # Load the upper bound value is 80.0

                            c.le.s $f3, $f1         # Compare the test result in $f1 with the lower bound $f3
                            bc1t printIfUnnormalByTestName   # If the test result is less than the lower bound, branch to ResultUNnormal

                            c.le.s $f4, $f5         # Compare the test result in $f1 with the upper bound $f4
                            bc1t printIfUnnormalByTestName   # If the test result is greater than the upper bound, branch to ResultUNnormal


                            beq $s7, 1, check_founded_test_name_unnormal
                            j  check_file_test_name_unnormal

              printIfUnnormalByTestName:

                                                    #store in bool_found the value 1 to indicate that the test result is found
                            li $t1, 1
                            sw $t1, bool_found

                            move $a0, $t9           # Load the address of the start of the line into $a0
                            jal printLine             # Jump to printLine to print the data for this line
                            
                            beq $s7, 1, menu   # If the end of the file is reached, return to the menu
                            j check_file_test_name_unnormal       # Continue to check file IDs			



    
        check_founded_test_name_unnormal:

            #if the bool_found = 1 mean the test result is found and updated
            #else the test result is not found and not updated

            lw $t1, bool_found
            beq $t1, 1, test_result_unnormal_by_test_name

            #if not found the record for update the test result print the message

            #print new line character

            li $v0, 11          # System call for printing a character
            li $a0, 10          # Load ASCII value of newline ('\n') into $a0
            syscall


            li $v0, 4
            la $a0, not_found_recorde
            syscall

            li $v0, 11          # System call for printing a character
            li $a0, 10          # Load ASCII value of newline ('\n') into $a0
            syscall

            j menu

            
      
        test_result_unnormal_by_test_name:

                li $v0, 11          # System call for printing a character
                li $a0, 10          # Load ASCII value of newline ('\n') into $a0
                syscall        
                
                li $v0, 4
                la $a0, found_unnormal_test
                syscall

                li $v0, 11          # System call for printing a character
                li $a0, 10          # Load ASCII value of newline ('\n') into $a0
                syscall

                #reset the value of bool_found to 0
                li $t1, 0
                sw $t1, bool_found

                j menu
        



j menu

boolTestNameCheck:

            move $t8, $ra # save the return address

    
            #load the value of the test name to check user_test_new_value to s0

            find_semicolon_for_test_name_check:

                lb $t0, 0($a0)        # Load the next character from the input string into $t0
                beq $t0, '\0', no_line_to_check # Check for the end of the string
                beq $t0, ':', check_test_name # If colon, test name matche
                addiu $a0, $a0, 1     # Move to the next character in the input string
                j find_semicolon_for_test_name_check      # Jump back to the start of the loop


                check_test_name: 
                li $t3, 0 # rest the value of asscii sum. 

                get_asscii_sum_of_test_name:

                addiu $a0, $a0, 1      # Skip the : character
                lb $t0, 0($a0)        # Load the next character from the input string into $t0
                beq $t0, ' ', get_asscii_sum_of_test_name # Check for the end of the string
                
                # sum the ascii values of the test name to choose the test value to calculate the average
                beq $t0, ',', compare_test_name # If colon, have unique value for each test name 
                addu $t3, $t3, $t0     # Add the ASCII value to the sum for test name comparison
                    
                jal get_asscii_sum_of_test_name

                compare_test_name:

                    # Check the sum of the ASCII values to determine the test name
                    li $t1, 0x111        # ASCII sum for "Hgb"
                    beq $t3, $t1, Hgb_test_check # If the sum matches "Hgb", jump to Hgb_test

                    li $t1, 0xDD         #  ASCII sum for "BGT"
                    beq $t3, $t1, BGT_test_check # If the sum matches "BGT", jump to BGT_test

                    li $t1, 0xDC        #  ASCII sum for "LDL"
                    beq $t3, $t1, LDL_test_check # If the sum matches "LDL", jump to LDL_test

                    li $t1, 0xE6         #  ASCII sum for "BPT"
                    beq $t3, $t1, BPT_test_check # If the sum matches "BPT", jump to BPT_test

                #return unique value for each test name

                    Hgb_test_check:
                    la $a0, user_test_new_value   # Load address of the value of the test result into $a0
                    lw $s0 , 0($a0) # load the value of the test result to s0
                    # compare the test name with the user_test_new_value
                    #then return to ra in t8
                    beq $s0,$t1 , equal_test_name # If the test name matches the user_test_new_value, return 1

                    BGT_test_check:
                    la $a0, user_test_new_value   # Load address of the value of the test result into $a0
                    lw $s0 , 0($a0) # load the value of the test result to s0
                    beq $s0,$t1 , equal_test_name # If the test name matches the user_test_new_value, return 1
                  

                    LDL_test_check:
                    la $a0, user_test_new_value   # Load address of the value of the test result into $a0
                    lw $s0 , 0($a0) # load the value of the test result to s0
                    beq $s0,$t1 , equal_test_name # If the test name matches the user_test_new_value, return 1
                  
                    BPT_test_check:
                    la $a0, user_test_new_value   # Load address of the value of the test result into $a0
                    lw $s0 , 0($a0) # load the value of the test result to s0
                    beq $s0,$t1 , equal_test_name # If the test name matches the user_test_new_value, return 1


                    move $ra, $t8 # no match return 0
                    li $t5, 0
                    jr $ra
                    

                    equal_test_name:
                    li $t5, 1
                    move $ra, $t8 # restore the return addres
                    jr $ra

                    no_line_to_check:
                    li $t5, 0
                    move $ra, $t8 # restore the return addres
                    li $s7 , 1 # set the value of s7 to 1 to indicate that the buffer is done.
                    jr $ra
                    