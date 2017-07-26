# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
IO.foreach("votes.txt")  do |line|

#   VOTE 1168041980 Campaign:ssss_uk_01B Validity:during Choice:Tupele
# CONN:MIG00VU MSISDN:00777778429999
# GUID:A12F2CF1-FDD4-46D4-A582-AD58BAA05E19 Shortcode:63334

# - All well-formed lines will have the same fields, in the same order. They
#  will all begin with VOTE, then have an epoch time value, then a set
#  of fields with an identifier, a colon, and the value of the field
#  (e.g. 'Campaign:ssss_uk_01B')
  line.force_encoding("ISO-8859-1")
  regex = /(^VOTE [0-9]+ Campaign:[_a-z0-9A-Z]+ Validity:[a-z]+ Choice:[a-zA-Z]+ CONN:[a-z0-9A-Z]+ MSISDN:[0-9]+ GUID:[A-Z0-9-]+ Shortcode:[0-9]+$)/
  if (regex === line.chomp)
    #create vote hash
    vote = line.chomp.gsub("VOTE ", "Epoch_Time:").split(" ").map{|array| array.split(":")}.to_h
    Vote.create!(
      epoch_time: vote["Epoch_Time"],
      campaign: vote["Campaign"],
      validity: vote["Validity"],
      choice: vote["Choice"],
      conn: vote["CONN"],
      msisdn: vote["MSISDN"],
      guid: vote["GUID"],
      short_code: vote["Shortcode"]
    )
  else
    p "Line cannot be imported, does not much criteria:"
    p line.chomp
  end
end