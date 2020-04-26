# seed data file 
@guard1 = Guard.create(
   name: "Joe Smith",
   email: "joe@example.com",
   number: 1234445656,
   password: "joe1234",
   company: "Guard Tower Security"
)

@report1 = Report.create(
   report_type: "Daily Activity Report",
   guard_id: @guard1.id,
   location: "Long Island NY",
   description: "Patroled the perimeter"
)