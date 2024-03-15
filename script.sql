CREATE DATABASE IF NOT EXISTS Alumni_Mentoring_DB;
USE Alumni_Mentoring_DB;

DROP TABLE IF EXISTS training_appointment;
DROP TABLE IF EXISTS career_peer_staff;
DROP TABLE IF EXISTS onboarding_appt_mentees;
DROP TABLE IF EXISTS onboarding_appt_mentors;
DROP TABLE IF EXISTS mentoring_session;
-- DROP TABLE IF EXISTS participants;
DROP TABLE IF EXISTS mentees;
DROP TABLE IF EXISTS mentors;
DROP TABLE IF EXISTS company;

-- Creation of tables
-- Company
CREATE TABLE company (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name TEXT NOT NULL,
    company_sector TEXT NOT NULL,
    company_size INT NOT NULL,
    company_location TEXT NOT NULL,
    company_website TEXT NOT NULL,
    company_phone VARCHAR(20) NOT NULL
);

-- Mentors
CREATE TABLE mentors (
    mentor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    major TEXT NOT NULL,
    concentration VARCHAR(50),
    grad_year INT NOT NULL,
    years_of_experience INT NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    industry VARCHAR(100),
    career_skills VARCHAR(400),
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES company(company_id)
);

-- Mentees
CREATE TABLE mentees (
    mentee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    major TEXT NOT NULL,
    concentration VARCHAR(50),
    grad_year INT NOT NULL,
    career_interests_fr TEXT NOT NULL,
    career_goals VARCHAR(400),
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    mentor_id INT,
    FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id)
);


-- Mentoring Session
CREATE TABLE mentoring_session (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    mentee_id INT,
    FOREIGN KEY (mentee_id) REFERENCES mentees(mentee_id),
    session_date DATE,
    session_time TIME,
    session_duration INT,
    session_location TEXT,
    session_modality TEXT,
    session_topic TEXT
);

-- Career Peer Staff
CREATE TABLE career_peer_staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_role TEXT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- Onboarding Appointment
CREATE TABLE training_appointment (
    training_appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    training_date DATE,
    training_time TIME,
    duration INT,
    appt_location VARCHAR(20),
    appt_modality VARCHAR(20),
    reason_for_appt ENUM('Onboarding', 'Training'),
    topics_covered VARCHAR(400),
    feedback VARCHAR(100),
    staff_id INT,
    FOREIGN KEY (staff_id) REFERENCES career_peer_staff(staff_id),
    mentor_id INT,
    FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id),
    mentee_id INT,
    FOREIGN KEY (mentee_id) REFERENCES mentees(mentee_id)
    
);

-- Dummy data for the tables
-- Not using real data for privacy reasons

-- Insert dummy data into the company table
INSERT INTO company (company_name, company_sector, company_size, company_location, company_website, company_phone)
VALUES 
    ('Google', 'Technology', 20000, 'Mountain View, CA', 'www.google.com', '650-253-0000'),
    ('Apple Inc.', 'Technology', 15000, 'Cupertino, CA', 'www.apple.com', '408-996-1010'),
    ('Amazon', 'Technology', 30000, 'Seattle, WA', 'www.amazon.com', '206-266-1000'),
    ('Microsoft', 'Technology', 25000, 'Redmond, WA', 'www.microsoft.com', '425-882-8080'),
    ('JPMorgan Chase & Co.', 'Finance', 50000, 'New York, NY', 'www.jpmorganchase.com', '212-270-6000'),
    ('Goldman Sachs', 'Finance', 40000, 'New York, NY', 'www.goldmansachs.com', '212-902-1000'),
    ('Bank of America', 'Finance', 45000, 'Charlotte, NC', 'www.bankofamerica.com', '704-386-5681'),
    ('Johnson & Johnson', 'Healthcare', 60000, 'New Brunswick, NJ', 'www.jnj.com', '732-524-0400'),
    ('Procter & Gamble', 'Consumer Goods', 55000, 'Cincinnati, OH', 'www.pg.com', '513-983-1100'),
    ('Tesla', 'Automotive', 35000, 'Palo Alto, CA', 'www.tesla.com', '650-681-5000'),
    ('Facebook', 'Technology', 18000, 'Menlo Park, CA', 'www.facebook.com', '650-543-4800'),
    ('Walmart', 'Retail', 2000000, 'Bentonville, AR', 'www.walmart.com', '479-273-4000'),
    ('The Coca-Cola Company', 'Beverages', 80000, 'Atlanta, GA', 'www.coca-colacompany.com', '404-676-2121'),
    ('IBM', 'Technology', 35000, 'Armonk, NY', 'www.ibm.com', '914-499-1900'),
    ('Verizon Communications', 'Telecommunications', 130000, 'New York, NY', 'www.verizon.com', '212-395-1000'),
    ('Johnson Controls', 'Industrials', 45000, 'Cork, Ireland', 'www.johnsoncontrols.com', '414-524-1200'),
    ('Cisco Systems', 'Technology', 70000, 'San Jose, CA', 'www.cisco.com', '800-553-6387'),
    ('Accenture', 'Technology', 57000, 'Dublin, Ireland', 'www.accenture.com', '353-1-646-2000'),
    ('Oracle Corporation', 'Technology', 65000, 'Redwood City, CA', 'www.oracle.com', '650-506-7000'),
    ('AT&T Inc.', 'Telecommunications', 270000, 'Dallas, TX', 'www.att.com', '210-821-4105');

-- Insert dummy data into the mentors table
INSERT INTO mentors (first_name, last_name, major, concentration, grad_year, years_of_experience, job_title, industry, career_skills, email, phone, company_id)
VALUES
    ('John', 'Doe', 'Business Administration', 'Marketing', 2010, 8, 'Marketing Manager', 'Marketing', 'Marketing', 'john.doe@example.com', '555-111-2222', 1),
    ('Jane', 'Smith', 'Economics', 'Finance', 2008, 10, 'Financial Analyst', 'Finance', 'Finance', 'jane.smith@example.com', '555-333-4444', 2),
    ('Alice', 'Johnson', 'Industrial Technology & Packaging', 'Packaging', 2015, 5, 'Packaging Engineer', 'Manufacturing', 'Packaging', 'alice.johnson@example.com', '555-555-6666', 3),
    ('Michael', 'Wilson', 'Business Administration', 'Management & Human Resources', 2012, 7, 'HR Manager', 'Human Resources', 'Networking', 'michael.wilson@example.com', '555-777-8888', 4),
    ('Emily', 'Brown', 'Economics', 'Finance', 2014, 6, 'Financial Advisor', 'Finance', 'Offer & Negotiation Phase', 'emily.brown@example.com', '555-999-0000', 5),
    ('Robert', 'Davis', 'Industrial Technology & Packaging', 'Packaging', 2016, 4, 'Packaging Designer', 'Manufacturing', 'Packaging', 'robert.davis@example.com', '555-123-4567', 6),
    ('Jessica', 'Miller', 'Business Administration', 'Marketing', 2011, 9, 'Marketing Director', 'Marketing', 'Personal Brand', 'jessica.miller@example.com', '555-765-4321', 7),
    ('Andrew', 'Martinez', 'Economics', 'Finance', 2013, 8, 'Financial Manager', 'Finance', 'Internship/Full-time Search', 'andrew.martinez@example.com', '555-987-6543', 8),
    ('Sarah', 'Garcia', 'Industrial Technology & Packaging', 'Packaging', 2017, 3, 'Packaging Consultant', 'Manufacturing', 'Resume and Cover Letter', 'sarah.garcia@example.com', '555-678-9012', 9),
    ('David', 'Rodriguez', 'Business Administration', 'Management & Human Resources', 2010, 10, 'HR Consultant', 'Human Resources', 'Networking', 'david.rodriguez@example.com', '555-234-5678', 10),
    ('Rachel', 'Hernandez', 'Economics', 'Finance', 2015, 5, 'Financial Planner', 'Finance', 'Offer & Negotiation Phase', 'rachel.hernandez@example.com', '555-890-1234', 11),
    ('Jason', 'Lopez', 'Industrial Technology & Packaging', 'Packaging', 2012, 8, 'Packaging Specialist', 'Manufacturing', 'Internship/Full-time Search', 'jason.lopez@example.com', '555-456-7890', 12),
    ('Amanda', 'Perez', 'Business Administration', 'Marketing', 2014, 6, 'Marketing Coordinator', 'Marketing', 'Personal Brand', 'amanda.perez@example.com', '555-321-0987', 13),
    ('Kevin', 'Gonzalez', 'Economics', 'Finance', 2011, 9, 'Financial Analyst', 'Finance', 'Resume and Cover Letter', 'kevin.gonzalez@example.com', '555-567-8901', 14),
    ('Laura', 'Sanchez', 'Industrial Technology & Packaging', 'Packaging', 2013, 7, 'Packaging Engineer', 'Manufacturing', 'Networking', 'laura.sanchez@example.com', '555-678-0123', 15);

-- Insert dummy data into the mentees table
INSERT INTO mentees (first_name, last_name, major, concentration, grad_year, career_interests_fr, career_goals, email, phone, mentor_id)
VALUES
    ('Olivia', 'Ng', 'Business Administration', 'Management & Human Resources', 2022, 'Human Resources', '["Networking", "Career Fair"]', 'olivia.ng@example.com', '555-123-4567', 1),
    ('Ryan', 'Garcia', 'Economics', 'Finance', 2023, 'Investment Banking', '["Resume and Cover Letter", "Mock Interview"]', 'ryan.garcia@example.com', '555-234-5678', 2),
    ('Sophia', 'Liu', 'Industrial Technology & Packaging', 'Packaging', 2021, 'Product Development', '["Internship/Full-time Search (Handshake, LinkedIn)", "Career/Concentration Path"]', 'sophia.liu@example.com', '555-345-6789', 3),
    ('Ethan', 'Nguyen', 'Business Administration', 'Marketing', 2022, 'Brand Management', '["Offer & Negotiation Phase", "Navigation through internship or job experience"]', 'ethan.nguyen@example.com', '555-456-7890', 4),
    ('Ava', 'Gonzalez', 'Economics', 'Finance', 2023, 'Financial Analysis', '["Personal Brand", "Networking"]', 'ava.gonzalez@example.com', '555-567-8901', 5),
    ('Daniel', 'Martinez', 'Industrial Technology & Packaging', 'Packaging', 2021, 'Logistics', '["Career Fair", "Offer & Negotiation Phase"]', 'daniel.martinez@example.com', '555-678-9012', 6),
    ('Isabella', 'Smith', 'Business Administration', 'Management & Human Resources', 2022, 'Human Resources', '["Internship/Full-time Search (Handshake, LinkedIn)", "Career/Concentration Path"]', 'isabella.smith@example.com', '555-789-0123', 7),
    ('Noah', 'Rodriguez', 'Economics', 'Finance', 2023, 'Corporate Finance', '["Resume and Cover Letter", "Mock Interview"]', 'noah.rodriguez@example.com', '555-890-1234', 8),
    ('Mia', 'Lopez', 'Industrial Technology & Packaging', 'Packaging', 2021, 'Quality Control', '["Personal Brand", "Career Fair"]', 'mia.lopez@example.com', '555-901-2345', 9),
    ('Elijah', 'Hernandez', 'Business Administration', 'Marketing', 2022, 'Product Marketing', '["Networking", "Offer & Negotiation Phase"]', 'elijah.hernandez@example.com', '555-012-3456', 10),
    ('Charlotte', 'Gonzalez', 'Economics', 'Finance', 2023, 'Investment Management', '["Career Fair", "Navigation through internship or job experience"]', 'charlotte.gonzalez@example.com', '555-123-4567', 11),
    ('Aiden', 'Perez', 'Industrial Technology & Packaging', 'Packaging', 2021, 'Product Development', '["Personal Brand", "Mock Interview"]', 'aiden.perez@example.com', '555-234-5678', 12),
    ('Amelia', 'Torres', 'Business Administration', 'Management & Human Resources', 2022, 'Human Resources', '["Resume and Cover Letter", "Networking"]', 'amelia.torres@example.com', '555-345-6789', 13),
    ('James', 'Flores', 'Economics', 'Finance', 2023, 'Financial Planning', '["Internship/Full-time Search (Handshake, LinkedIn)", "Career/Concentration Path"]', 'james.flores@example.com', '555-456-7890', 14),
    ('Harper', 'Rivera', 'Industrial Technology & Packaging', 'Packaging', 2021, 'Logistics', '["Networking", "Offer & Negotiation Phase"]', 'harper.rivera@example.com', '555-567-8901', 15);

-- Insert dummy data into the career_peer_staff table
INSERT INTO career_peer_staff (staff_role, first_name, last_name, email, phone)
VALUES
    ('Career Advisor', 'Sarah', 'Miller', 'sarah.miller@example.com', '555-987-6543'),
    ('Career Advisor', 'Robert', 'Wilson', 'robert.wilson@example.com', '555-876-5432'),
    ('Career Advisor Lead', 'Jennifer', 'Garcia', 'jennifer.garcia@example.com', '555-765-4321'),
    ('Career Advisor Manager', 'Michael', 'Martinez', 'michael.martinez@example.com', '555-654-3210');

-- Insert dummy data into the training_appointment table
INSERT INTO training_appointment (training_date, training_time, duration, appt_location, appt_modality, reason_for_appt, topics_covered, feedback, staff_id, mentor_id, mentee_id)
VALUES
    -- Onboarding Appointments for Mentors
    ('2024-04-01', '10:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Introduction to Mentorship Program', 'Good session', 1, 1, NULL),
    ('2024-04-02', '09:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Mentorship Program Policies and Guidelines', 'Very helpful', 2, 2, NULL),
    ('2024-04-03', '11:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Expectations and Responsibilities', 'Great interaction', 3, 3, NULL),
    ('2024-04-04', '14:00:00', 60, 'Training Room 1', 'In-Person', 'Onboarding', 'Networking Strategies', 'Good session', 1, 4, NULL),
    ('2024-04-05', '10:00:00', 45, 'Virtual', 'Video Call', 'Onboarding', 'Resume Building Techniques', 'Very helpful', 2, 5, NULL),
    ('2024-04-06', '09:00:00', 30, 'Conference Room', 'In-Person', 'Onboarding', 'Effective Communication Skills', 'Great interaction', 3, 6, NULL),
    ('2024-04-07', '13:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Introduction to Mentorship Program', 'Excellent feedback', 1, 7, NULL),
    ('2024-04-08', '14:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Mentorship Program Policies and Guidelines', 'Good session', 2, 8, NULL),
    ('2024-04-09', '10:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Expectations and Responsibilities', 'Very helpful', 3, 9, NULL),
    ('2024-04-10', '11:00:00', 45, 'Office', 'In-Person', 'Onboarding', 'Mock Interview Preparation', 'Great session', 1, 10, NULL),
    ('2024-04-11', '13:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Networking Skills Development', 'Excellent interaction', 2, 11, NULL),
    ('2024-04-12', '09:00:00', 30, 'Conference Room', 'In-Person', 'Onboarding', 'Presentation Techniques', 'Good session', 3, 12, NULL),
    ('2024-04-13', '14:00:00', 60, 'Training Room 2', 'In-Person', 'Onboarding', 'Leadership Development', 'Very helpful', 1, 13, NULL),
    ('2024-04-14', '10:00:00', 45, 'Virtual', 'Video Call', 'Onboarding', 'Team Collaboration Strategies', 'Great interaction', 2, 14, NULL),
    ('2024-04-15', '09:00:00', 30, 'Conference Room', 'In-Person', 'Onboarding', 'Problem Solving Techniques', 'Good session', 3, 15, NULL),

    -- Onboarding Appointments for Mentees
    ('2024-04-16', '10:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Introduction to Mentorship Program', 'Good session', 1, NULL, 1),
    ('2024-04-17', '09:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Mentorship Program Policies and Guidelines', 'Very helpful', 2, NULL, 2),
    ('2024-04-18', '11:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Expectations and Responsibilities', 'Great interaction', 3, NULL, 3),
    ('2024-04-19', '14:00:00', 60, 'Training Room 1', 'In-Person', 'Onboarding', 'Networking Strategies', 'Good session', 1, NULL, 4),
    ('2024-04-20', '10:00:00', 45, 'Virtual', 'Video Call', 'Onboarding', 'Resume Building Techniques', 'Very helpful', 2, NULL, 5),
    ('2024-04-21', '09:00:00', 30, 'Conference Room', 'In-Person', 'Onboarding', 'Effective Communication Skills', 'Great interaction', 3, NULL, 6),
    ('2024-04-22', '13:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Introduction to Mentorship Program', 'Excellent feedback', 1, NULL, 7),
    ('2024-04-23', '14:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Mentorship Program Policies and Guidelines', 'Good session', 2, NULL, 8),
    ('2024-04-24', '10:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Expectations and Responsibilities', 'Very helpful', 3, NULL, 9),
    ('2024-04-25', '11:00:00', 45, 'Office', 'In-Person', 'Onboarding', 'Mock Interview Preparation', 'Great session', 1, NULL, 10),
    ('2024-04-26', '13:00:00', 60, 'Virtual', 'Video Call', 'Onboarding', 'Networking Skills Development', 'Excellent interaction', 2, NULL, 11),
    ('2024-04-27', '09:00:00', 30, 'Conference Room', 'In-Person', 'Onboarding', 'Presentation Techniques', 'Good session', 3, NULL, 12),
    ('2024-04-28', '14:00:00', 60, 'Training Room 2', 'In-Person', 'Onboarding', 'Leadership Development', 'Very helpful', 1, NULL, 13),
    ('2024-04-29', '10:00:00', 45, 'Virtual', 'Video Call', 'Onboarding', 'Team Collaboration Strategies', 'Great interaction', 2, NULL, 14),
    ('2024-04-30', '09:00:00', 30, 'Conference Room', 'In-Person', 'Onboarding', 'Problem Solving Techniques', 'Good session', 3, NULL, 15),
-- General Training Appointments
    ('2024-05-01', '10:00:00', 60, 'Virtual', 'Video Call', 'Training', 'Effective Communication Skills', 'Good session', 1, 1, NULL),
    ('2024-05-02', '09:00:00', 60, 'Virtual', 'Video Call', 'Training', 'Resume Writing Workshop', 'Very helpful', 2, 2, NULL),
    ('2024-05-03', '11:00:00', 60, 'Virtual', 'Video Call', 'Training', 'Interview Preparation Seminar', 'Great interaction', 3, 3, NULL),
    ('2024-05-04', '14:00:00', 60, 'Training Room 1', 'In-Person', 'Training', 'Leadership Development Workshop', 'Good session', 1, 4, NULL),
    ('2024-05-05', '10:00:00', 45, 'Virtual', 'Video Call', 'Training', 'Networking Strategies', 'Very helpful', 2, 5, NULL),
    ('2024-05-06', '09:00:00', 30, 'Conference Room', 'In-Person', 'Training', 'Time Management Training', 'Great interaction', 3, 6, NULL);

-- Insert dummy data into the mentoring_session table
INSERT INTO mentoring_session (mentee_id, session_date, session_time, session_duration, session_location, session_modality, session_topic)
VALUES
    (1, '2024-03-15', '10:00:00', 60, 'Virtual', 'Video Call', 'Resume and Cover Letter'),
    (2, '2024-03-16', '11:00:00', 45, 'Office', 'In-Person', 'Internship/Full-time Search'),
    (3, '2024-03-17', '09:00:00', 30, 'Conference Room', 'In-Person', 'Personal Brand'),
    (4, '2024-03-18', '13:00:00', 60, 'Virtual', 'Video Call', 'Networking'),
    (5, '2024-03-19', '14:00:00', 45, 'Office', 'In-Person', 'Offer & Negotiation Phase'),
    (6, '2024-03-20', '10:00:00', 30, 'Conference Room', 'In-Person', 'Career Fair'),
    (7, '2024-03-21', '11:00:00', 60, 'Virtual', 'Video Call', 'Navigation through internship or job experience'),
    (8, '2024-03-22', '13:00:00', 45, 'Office', 'In-Person', 'Mock Interview'),
    (9, '2024-03-23', '14:00:00', 30, 'Conference Room', 'In-Person', 'Career/Concentration Path'),
    (10, '2024-03-24', '15:00:00', 60, 'Virtual', 'Video Call', 'Alumni Mentoring Program'),
    (11, '2024-03-25', '10:00:00', 45, 'Office', 'In-Person', 'Guided self-assessment (PathwayU)'),
    (12, '2024-03-26', '11:00:00', 30, 'Conference Room', 'In-Person', 'Personal Brand'),
    (13, '2024-03-27', '13:00:00', 60, 'Virtual', 'Video Call', 'Resume and Cover Letter'),
    (14, '2024-03-28', '14:00:00', 45, 'Office', 'In-Person', 'Internship/Full-time Search'),
    (15, '2024-03-29', '09:00:00', 30, 'Conference Room', 'In-Person', 'Mock Interview');
-- Queries

-- List all mentors along with their associated company name and industry.
SELECT m.mentor_id, m.first_name, m.last_name, c.company_name, c.company_sector AS industry
FROM mentors m
JOIN company c ON m.company_id = c.company_id;

-- Find all mentees with a concentration of 'Finance' and their respective mentors.
SELECT me.mentee_id, me.first_name AS mentee_first_name, me.last_name AS mentee_last_name, 
       mo.first_name AS mentor_first_name, mo.last_name AS mentor_last_name
FROM mentees me
JOIN mentors mo ON me.mentor_id = mo.mentor_id
WHERE me.concentration LIKE '%Finance%';

-- Find the average session duration for mentoring sessions.
SELECT AVG(session_duration) AS average_duration
FROM mentoring_session;

-- SubQueries
-- Find mentors who work in the 'Technology' sector and have had at least one mentoring session.
SELECT m.mentor_id, m.first_name, m.last_name, c.company_sector
FROM mentors m
JOIN company c ON m.company_id = c.company_id
WHERE c.company_sector = 'Technology' AND m.mentor_id IN (
    SELECT mentor_id FROM mentoring_session
);

-- List mentees who have had a mentoring session on 'Resume and Cover Letter' topic.
SELECT me.mentee_id, me.first_name, me.last_name
FROM mentees me
WHERE me.mentee_id IN (
    SELECT mentee_id FROM mentoring_session WHERE session_topic = 'Resume and Cover Letter'
);

-- Get the company names that have mentors with more than 5 years of experience.
SELECT DISTINCT c.company_name
FROM company c
JOIN mentors m ON c.company_id = m.company_id
WHERE m.years_of_experience > 5;

-- Get list of Mentors and their resepctive average mentoring session time 
SELECT m.mentor_id, m.first_name, m.last_name,
       (
           SELECT AVG(ms.session_duration)
           FROM mentoring_session ms
           WHERE ms.mentor_id = m.mentor_id
       ) AS average_session_duration
FROM mentors m
ORDER BY average_session_duration DESC;
