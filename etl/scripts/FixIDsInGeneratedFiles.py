import csv

# Function to detect the delimiter in the file
def detect_delimiter(filename):
    with open(filename, 'r') as file:
        dialect = csv.Sniffer().sniff(file.read(1024))
    return dialect.delimiter

# Function to process the file
def process_file(filename):
    delimiter = detect_delimiter(filename)
    data = []

    with open(filename, 'r') as file:
        reader = csv.reader(file, delimiter=delimiter)
        for row in reader:
            data.append(row)

    # Add 1 to every value in the first column
    for row in data:
        row[0] = str(int(row[0]) + 1)

    # Write the updated data back to the file
    with open(filename, 'w', newline='') as file:
        writer = csv.writer(file, delimiter=delimiter)
        writer.writerows(data)


# Function to process the Excel file
def process_excel_file(filename):
    delimiter = detect_delimiter(filename)
    data = []

    with open(filename, 'r') as file:
        reader = csv.reader(file, delimiter=delimiter)
        next(reader)  # Skip the header row
        for row in reader:
            data.append(row)

    # Add 1 to every value in the first column
    for row in data:
        row[0] = str(int(row[0]) + 1)

    # Write the updated data back to the file, including the header row
    with open(filename, 'w', newline='') as file:
        writer = csv.writer(file, delimiter=delimiter)
        writer.writerow(['Kindergarten ID', 'Kindergarten name', 'District', 'City', 'Location price', 'Toddler age group price', 'Junior age group price', 'Preschooler age group price', 'Full-day care type price', 'Half-day care type price', 'Extended care type price', 'Drop-in care type price'])  # Replace with your actual header row
        writer.writerows(data)


# Function to update the care type
def update_care_type(filename):
    delimiter = detect_delimiter(filename)
    data = []

    with open(filename, 'r') as file:
        reader = csv.reader(file, delimiter=delimiter)
        for row in reader:
            data.append(row)

    # Add 1 to every value in the third column
    for row in data:
        row[1] = str(int(row[1]) + 1)

    # Write the updated data back to the file
    with open(filename, 'w', newline='') as file:
        writer = csv.writer(file, delimiter=delimiter)
        writer.writerows(data)

# Call the function with the name of your file
#process_file(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_enrollments1.txt')
#process_file(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_enrollments2.txt')

#process_file(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_kindergarten1.txt')
#process_file(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_kindergarten2.txt')

#process_file(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_ratings1.txt')
#process_file(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_ratings2.txt')

#process_file(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\update_kindergarten_addresses.txt')

#process_excel_file(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab5\sources\CEO_Excel.csv')

#update_care_type(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_enrollments1.txt')
#update_care_type(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_enrollments2.txt')

#tutaj to tak naprawdę update_kindergraten_id w teacher w bazie danych
update_care_type(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_teachers1.txt')
update_care_type(r'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_teachers2.txt')