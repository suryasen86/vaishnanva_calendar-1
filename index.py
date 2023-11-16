import datetime

# Get the current date
current_date = datetime.date.today()

# Calculate the next Shukla Paksha (waxing moon) Ekadashi date and time
def calculate_shukla_paksha_ekadashi_date(date):
    while True:
        date += datetime.timedelta(days=1)  # Move to the next day
        if date.day == 11:  # Check if it's the 11th day of the lunar phase
            return date

next_shukla_paksha_ekadashi = calculate_shukla_paksha_ekadashi_date(current_date)
print("Next Shukla Paksha Ekadashi Date:", next_shukla_paksha_ekadashi)

# Calculate the next Krishna Paksha (waning moon) Ekadashi date and time
def calculate_krishna_paksha_ekadashi_date(date):
    while True:
        date += datetime.timedelta(days=1)  # Move to the next day
        if date.day == 11:  # Check if it's the 11th day of the lunar phase
            return date

next_krishna_paksha_ekadashi = calculate_krishna_paksha_ekadashi_date(current_date)
print("Next Krishna Paksha Ekadashi Date:", next_krishna_paksha_ekadashi)
