import operations as op
import gitignore as gi

def main():
    op.connect_database(gi.DRIVER, gi.SERVER, gi.DATABASE, gi.USER, gi.PASSWORD)
    connection = f'DRIVER={gi.DRIVER}; SERVER={gi.SERVER}; Trusted_Connection=yes; Database={gi.DATABASE}; UID={gi.USER}; PWD={gi.PASSWORD}'
    op.check_employees_table(connection)
    op.enter_employees_table(connection)
    op.fetch_employees_table(connection)

main() 
    
# Other Stuff to Added
# Security, tblEmployees is listed within the code, making it an parama can help
# Make the data insertion where it checks if it listed before being added
    