import operations as op
import gitignore as gi

def main():
    op.connect_database(gi.DATABASE)
    op.check_employees_table()
    op.enter_employees_table()
    op.fetch_employees_table()

main() 
    
# Other Stuff to Added
# Security, tblEmployees is listed within the code, making it an parama can help
# Make the data insertion where it checks if it listed before being added
    