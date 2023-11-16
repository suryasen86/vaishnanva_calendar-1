import calendar

# Define the month and year
year = 2023
month = 7  # September

# Get the number of days in the month
num_days = calendar.monthrange(year, month)[1]

# Get the day of the week for the 1st day of the month (0 = Monday, 6 = Sunday)
first_day_weekday = calendar.weekday(year, month, 1)w

# Create an array of arrays to represent the month
month_array = []

# Initialize variables to keep track of the day
day = 1

# Loop through the weeks in the month
while day <= num_days:
    week = []
    for i in range(7):
        if i < first_day_weekday and len(month_array) == 0:
            week.append('')
        else:
            if day <= num_days:
                week.append(day)
                day += 1
            else:
                week.append('')
    month_array.append(week)

# Print the month array
for week in month_array:
    print(week)
