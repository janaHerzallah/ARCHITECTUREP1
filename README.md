# 🏥 Medical Test Management System (MIPS Assembly)

## 📚 Project Overview

This project is developed as part of the **Computer Architecture** course at **Birzeit University**, second semester 2023/2024.  
The goal is to build a **Medical Test Management System** using **MIPS Assembly**, allowing for the efficient storage, retrieval, and management of patient medical test data.

---

## 🎯 Objective

To simulate a basic electronic health record system, focusing on medical test results using file-based input and user-driven interaction through a text-based menu.

---

## 🗂️ Data Format

Each line in the input file represents a medical test with the following format:

📌 **Example:**

1300500: RBC, 2024-03, 13.5
1300511: LDL, 2024-03, 110


- **Patient ID**: 7-digit integer  
- **Test Name**: Fixed-length string  
- **Date**: Fixed format (YYYY-MM)  
- **Result**: Floating-point number

---

## 🧪 Supported Medical Tests

| Test                          | Normal Range                               |
|------------------------------|---------------------------------------------|
| Hemoglobin (Hgb)             | 13.8 – 17.2 g/dL                            |
| Blood Glucose Test (BGT)     | 70 – 99 mg/dL                               |
| LDL Cholesterol (LDL)        | Less than 100 mg/dL                         |
| Blood Pressure Test (BPT)    | Systolic < 120 mm Hg, Diastolic < 80 mm Hg |

---

## 📋 Features

- ✅ **Add New Medical Test**
  - Stores new test data with full input validation.
- 🔍 **Search by Patient ID**
  - Retrieve all tests for a patient.
  - Retrieve only abnormal tests.
  - Retrieve tests from a specific date period.
- ⚠️ **Search for Abnormal Results**
  - Filter all abnormal results based on selected test type.
- 📊 **Average Test Values**
  - Display average result per test type.
- 📝 **Update Test Result**
  - Edit an existing test record.
- ❌ **Delete a Test**
  - Remove a specific test entry.
- 🛡️ **Error Handling**
  - Invalid patient ID, non-existent tests, incorrect file names.
- ✅ **Data Validation**
  - Ensures valid IDs, formats, and input data types.

---

## 🛠 Technologies

- **Language**: MIPS Assembly
- **Platform**: MIPS Simulator (e.g., MARS, SPIM)
- **Data Storage**: External text file (input/output)

---

## 🧪 Testing

Includes at least two sample input test files to verify:
- All valid system functionalities.
- Edge cases and error handling.

