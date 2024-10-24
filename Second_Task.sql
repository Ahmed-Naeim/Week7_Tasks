-- Create the actor table
CREATE TABLE actor (
    act_id INT PRIMARY KEY,
    act_fname CHAR(20),
    act_lname CHAR(20),
    act_gender CHAR(1)
);

-- Create the movie table
CREATE TABLE movie (
    mov_id INT PRIMARY KEY,
    mov_title CHAR(50),
    mov_year INT,
    mov_time INT,
    mov_lang CHAR(50),
    mov_dt_rel DATE,
    mov_rel_country CHAR(5)
);

-- Create the genres table
CREATE TABLE genres (
    gen_id INT PRIMARY KEY,
    gen_title CHAR(20)
);

-- Create the movie_cast table
CREATE TABLE movie_cast (
    act_id INT,
    mov_id INT,
    role CHAR(30),
    PRIMARY KEY (act_id, mov_id),
    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

-- Create the movie_genres table
CREATE TABLE movie_genres (
    mov_id INT,
    gen_id INT,
    PRIMARY KEY (mov_id, gen_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);

-- Create the director table
CREATE TABLE director (
    dir_id INT PRIMARY KEY,
    dir_fname CHAR(20),
    dir_lname CHAR(20)
);

-- Create the movie_direction table
CREATE TABLE movie_direction (
    dir_id INT,
    mov_id INT,
    PRIMARY KEY (dir_id, mov_id),
    FOREIGN KEY (dir_id) REFERENCES director(dir_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

-- Create the reviewer table
CREATE TABLE reviewer (
    rev_id INT PRIMARY KEY,
    rev_name CHAR(30)
);

-- Create the rating table
CREATE TABLE rating (
    rev_id INT,
    mov_id INT,
    rev_stars INT,
    num_o_ratings INT,
    PRIMARY KEY (rev_id, mov_id),
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);
