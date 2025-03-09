import csv
import random

def update_ratings(file_path):
    # Read the data from the file
    with open(file_path, 'r') as f:
        reader = csv.reader(f)
        data = list(reader)

    # Generate a list of unique random numbers
    random_numbers = random.sample(range(1, 21), len(data))

    # Update the second column of each row
    for i in range(len(data)):
        data[i][1] = random_numbers[i]

    # Write the updated data back to the file
    with open(file_path, 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerows(data)

#update_ratings(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab5\sources/insert_ratings1.txt')


def update_ratings_large(file_path):
    # Read the data from the file
    with open(file_path, 'r') as f:
        reader = csv.reader(f)
        data = list(reader)

    # Generate a list of unique random numbers
    random_numbers = random.sample(range(21, 1801), len(data))

    # Update the second column of each row
    for i in range(len(data)):
        data[i][1] = random_numbers[i]

    # Write the updated data back to the file
    with open(file_path, 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerows(data)

update_ratings_large(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab5\sources/insert_ratings2.txt')