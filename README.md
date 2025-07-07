**Project Title:** 
Phone Directory – Bash Script

**What It Does**

This bash script allows users to manage a phone contact list from the terminal. The following features are available:

1. **Add Contact**

   * Validates name (only alphabets)
   * Validates phone number (only digits)
   * Stores in `phonedir.log`

2. **Search Contact**

   * Case-insensitive search using `grep`

3. **Delete Contact**

   * Deletes a specific contact entry using `sed`

4. **View All Contacts**

   * Displays all saved contacts

5. **Delete All Contacts**

   * Confirms before deleting all content from `phonedir.log`

6. **Exit Program**

---

**Tech Used**

* **Bash (Shell Scripting)**
* **grep** – for searching contacts
* **sed** – for deleting specific contacts
* **File I/O** – for reading/writing from `phonedir.log`

---

**How to Run / Setup**

### Prerequisites

* A Linux/Mac system (or WSL/Git Bash on Windows)
* Bash shell installed

###  Steps to Run

1. **Download the Script**
   Save the script in a file, e.g. `phone_directory.sh`.

2. **Make It Executable**

   chmod +x phone_directory.sh

3. **Run the Script**

   ./phone_directory.sh

4. Follow the on-screen menu options.


## 🗂️ File Used

* `phonedir.log`

  > This file stores all contact entries in the format:
  > Name : Number
