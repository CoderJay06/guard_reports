# frozen_string_literal: true

Guard.destroy_all
Report.destroy_all

# seed data file
@guard1 = Guard.create(
  name: 'Joe Smith',
  email: 'joe@example.com',
  number: 1_234_445_656,
  password: 'joe1234',
  company: 'Guard Tower Security'
)

@report1 = Report.create(
  report_type: 'Daily Activity Report',
  guard_id: @guard1.id,
  location: 'Long Island NY',
  description: 'Patroled the perimeter of property.'
)

@guard2 = Guard.create(
  name: 'Bob Smith',
  email: 'bob@example.com',
  number: 1_534_447_657,
  password: 'bob1234',
  company: 'L4 Security'
)

@report2 = Report.create(
  report_type: 'Daily Activity Report',
  guard_id: @guard2.id,
  location: 'Orlando Florida',
  description: 'Monitored property and patroled perimeter.'
)
