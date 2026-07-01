CREATE TABLE Patients (
    patient_id    INT AUTO_INCREMENT PRIMARY KEY,
    full_name     VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender        ENUM('Male', 'Female', 'Other') NOT NULL,
    blood_type    VARCHAR(5),
    phone         VARCHAR(15),
    address       VARCHAR(255),
    registered_on DATE DEFAULT (CURRENT_DATE)
);
CREATE TABLE Doctors (
    doctor_id        INT AUTO_INCREMENT PRIMARY KEY,
    full_name        VARCHAR(100) NOT NULL,
    specialization   VARCHAR(100) NOT NULL,
    department       VARCHAR(100) NOT NULL,
    phone            VARCHAR(15),
    email            VARCHAR(100) UNIQUE,
    joining_date     DATE,
    experience_years INT
);
CREATE TABLE Appointments (
    appointment_id   INT AUTO_INCREMENT PRIMARY KEY,
    patient_id       INT NOT NULL,
    doctor_id        INT NOT NULL,
    appointment_date DATE NOT NULL,
    status           ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    reason           VARCHAR(255),
    notes            TEXT,

    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)  REFERENCES Doctors(doctor_id)
);
CREATE TABLE Medicines (
    medicine_id      INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id   INT NOT NULL,
    medicine_name    VARCHAR(100) NOT NULL,
    dosage           VARCHAR(50),
    duration_days    INT,
    prescribed_on    DATE DEFAULT (CURRENT_DATE),

    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

