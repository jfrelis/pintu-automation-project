# Pintu Automation Project

This project uses Robot Framework for automation testing.

## Installation

Follow these steps to set up the environment and run the tests.

### Prerequisites

- Python 3.x
- pip (Python package installer)

### Install Requirements

1. Clone the repository or download the project files.

2. Navigate to the project directory.

3. Install the required packages using `pip`:

    ```sh
    pip install -r requirements.txt
    ```

### Running the Tests

After installing the necessary packages, you can run the Robot Framework tests using the following command:

#### API
```sh
robot api/suites
```
Also, you can run the Robot Framework tests based on tags using the following command:
```sh
robot --include testTag api/suites
```

#### Mobile
```sh
robot mobile/suites
```
Also, you can run the Robot Framework tests based on tags using the following command:
```sh
robot --include testTag mobile/suites
```

### Test Report
Once you have successfully run the automation, your terminal will generate a directory that directs you to the test report. Open that file to view the test report. You can refer to the image below to see how the path directory is displayed:

<img width="768" alt="Screenshot 2024-08-05 at 18 34 35" src="https://github.com/user-attachments/assets/4735594b-9fa1-43e1-93b8-99698a5349dd">
