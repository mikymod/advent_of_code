use std::fs::File;
use std::io::{self, BufRead};

fn main() -> io::Result<()> {
    // Replace "your_input.txt" with the actual path to your calibration document
    let file_path = "input.txt";

    let file = File::open(&file_path)?;
    let total_sum: u32 = io::BufReader::new(file)
        .lines()
        .filter_map(|line| line.ok())
        .filter_map(|line| extract_calibration_value(&line))
        .sum();

    println!("Sum of calibration values: {}", total_sum);

    Ok(())
}

fn extract_calibration_value(line: &str) -> Option<u32> {
    let first_digit = line.chars().find(|c| c.is_digit(10))?;
    let last_digit = line.chars().rev().find(|c| c.is_digit(10))?;

    let first_digit_value = first_digit.to_digit(10)?;
    let last_digit_value = last_digit.to_digit(10)?;

    Some(first_digit_value * 10 + last_digit_value)
}

fn extract_calibration_value_correct(line: &str) {
    let nums = [
        "one", "1", "two", "2", "three", "3", "four", "4", "five", "5", "six", "6", "seven", "7",
        "eight", "8", "nine", "9",
    ];

    let mut total = 0;

    for i in 0..line.len() {
        for num in nums.iter() {
            if i + num.len() > line.len() {
                continue;
            }
        }
    }
}

// use std::fs::File;
// use std::io::{self, BufRead};

// fn main() -> io::Result<()> {
//     // Replace "your_input.txt" with the actual path to your calibration document
//     let file_path = "input.txt";

//     let file = File::open(&file_path)?;
//     let total_sum: u32 = io::BufReader::new(file)
//         .lines()
//         .filter_map(|line| line.ok())
//         .filter_map(|line| extract_calibration_value(&line))
//         .sum();

//     println!("Sum of calibration values: {}", total_sum);

//     Ok(())
// }

// fn extract_calibration_value(line: &str) -> Option<u32> {
//     let mut value = 0;
//     let mut in_number = false;

//     for c in line.chars() {
//         if c.is_digit(10) {
//             value = value * 10 + c.to_digit(10)?;
//             in_number = true;
//         } else if in_number {
//             // If we were in a number and the current character is not a digit,
//             // we've finished extracting the number.
//             break;
//         }
//     }

//     Some(value)
// }
