CREATE TABLE users(
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users(email) VALUES
('Katies34@yahoo.com'), ('Tunde@gmail.com');

-- INSERT INTO users(email, created_at) VALUES
-- ('dusty@gmail.com, ')