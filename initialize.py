import operations as op
import gitignore as gi

def main():
    op.connect_database(gi.DATABASE)
    op.check_employees_table()
    op.enter_employees_table()
    op.fetch_employees_table()

main() 
    
    