class Employee < ActiveRecord::Base
  attr_accessible :address, :age, :designation, :dob, :doj, :emp_id, :first_name, :last_name, :manager_emp_id, :manager_name, :mob_no, :off_email_id, :pan_no, :pers_email_id, :phone_no, :roles
validates_presence_of :address, :age, :designation, :dob, :doj, :emp_id, :first_name, :last_name, :manager_emp_id, :manager_name, :mob_no, :off_email_id, :pan_no, :pers_email_id, :phone_no, :roles
validates_uniqueness_of :emp_id,:mob_no, :pan_no, :off_email_id, :pers_email_id
validates_length_of :mob_no, :is => 10
validates_numericality_of :age, :emp_id, :manager_emp_id, :mob_no, :phone_no, :only_integer => true, :greater_than_or_equal_to => 0, :message => " Please enter a positive integer value this field"
has_many :leaves
has_many :subordinates, :class_name => "Employee", :foreign_key => "manager_emp_id"
belongs_to :manager, :class_name => "Employee"
end
