# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(:email => "jayxni@gmail.com", :first_name => "Jay", :last_name => "N", :phone_number => "(512)2312512", :unit_number => "3F", :password => "asdf", :password_confirmation => "asdf")
user2 = User.create(:email => "liane@gmail.com", :first_name => "Liane", :last_name => "P", :phone_number => "(512)2312512", :unit_number => "3F", :password => "asdf", :password_confirmation => "asdf")
user3 = User.create(:email => "tyler@gmail.com", :first_name => "Tyler", :last_name => "S", :phone_number => "(512)2312512", :unit_number => "3F", :password => "asdf", :password_confirmation => "asdf")
user4 = User.create(:email => "jolena@gmail.com", :first_name => "Jolena", :last_name => "B", :phone_number => "(512)2312512", :unit_number => "3F", :password => "asdf", :password_confirmation => "asdf")
user5 = User.create(:email => "sarah@gmail.com", :first_name => "Sarah", :last_name => "H", :phone_number => "(512)2312512", :unit_number => "3F", :password => "asdf", :password_confirmation => "asdf")
user6 = User.create(:email => "juan@gmail.com", :first_name => "Juan", :last_name => "P", :phone_number => "(512)2312512", :unit_number => "3F", :password => "asdf", :password_confirmation => "asdf")

# Thread 1

parent = Content.create(:user_id => user4.id, :title => "Guest Parking",
:description => "Hey All
\nI have a quick request for the guest space.  I'll need it for just about an hour or so this morning.
\nPlease let me know if this is a problem.
\n- Jolena")

Content.create(:parent_id => parent.id, :user_id => user4.id, :description => "Looks like Jeff is in both spaces.  Juan, can I borrow your spot for a bit?  So sorry - my friend is here right now.\n-Jolena")
Content.create(:parent_id => parent.id, :user_id => user3.id, :description => "If you're still looking for a spot, Stacy and I will be out for most of the day so you can use our spot.")

# Thread 2

parent = Content.create(:user_id => user4.id, :title => "Spot #9", :description => "Hi All –
\nSorry, I guess I should have sent this out once the parking lot was done.  The numbers on the east side have changed.  We eliminated space #5 on the west side which was an old Guest Space that was no longer usable.  Legal Descriptions remained the same as legally the lot is only zoned for 7 parking spaces.  We striped it so that there would be a spare for guest use – this is essentially owned by all of us!! 
\nUnless Jeff plans to park in the Alley, I’m pretty sure Sarah means he’s parking in the Guest Space, which is now #8!
\nWe’ll can submit this revised numbering into the Minutes of the next meeting.  Which means we should probably start looking at dates for the next meeting!
\n-Jolena")

# Thread 3

parent = Content.create(:user_id => user2.id, :title => "Wall Repair",
:description => "Dear All:
\nI just want to send a quick thank you to Tyler for volunteering to repair and paint the gouge in the drywall on the landing leading to the 3rd floor this past weekend. 
\nGoing forward, please remember to be careful with suitcases, bags and boxes in the stairwell and if you damage a wall, please let either myself or Jolena know. 
\nThank you again, Tyler!")

Content.create(:parent_id => parent.id, :user_id => user4.id, :title => "Wall Repair",
:description => "Yes, thanks Tyler for fixing the wall.  It’s so perfect you can’t even tell where the patch was made!!
\nThis brings up another issue – looks like we have a light bulb out in the in front stairwell.  Would anyone like to volunteer to be the light bulb point person?  This is a fun job – you get to buy light bulbs, submit receipts for reimbursement and use a ladder!!  Our last light bulb guy actually moved out a few years ago, so you don’t even have a tough act to follow.  And if you volunteer for this assignment, you’ll be off the hook for the next one and who knows what that might be!
\n-Jolena")

# Thread 4

parent = Content.create(:user_id => user1.id, :title => "Comcast Slow?",
:description => "Hey all,
\nIs anyone else in the building on Comcast and noticing really slow internet speeds?
\nI'm getting < 0.5 mbps down and 11 mbps up (testing on speedtest.net).  It varies from day to day but I'm having a lot of issues with it.  Just wondering if anyone is seeing the same...
\nThanks!")

Content.create(:parent_id => parent.id, :user_id => user3.id,
:description => "Sorry Jay, I have AT&T u verse.")

Content.create(:parent_id => parent.id, :user_id => user6.id,
:description => "Jay - I am also on Comcast. The speed has been spotty in the last 2 days.")

Content.create(:parent_id => parent.id, :user_id => user1.id,
:description => "OK, it appears back to normal (12 mbps down) for now.  Thanks ... just wanted to make sure it wasn't just me.
\nIf it continues then I will call them and schedule an appointment to look at the lines.")

Content.create(:parent_id => parent.id, :user_id => user5.id,
:description => "I've noticed it very slow lately as well.")

# Thread 5

parent = Content.create(:user_id => user4.id, :title => "PLEASE READ: Updated plan for Parking Lot work",
:description => "Hi Everyone -
\nOnce again, the weather has altered our plan for the parking lot.  Rain coming this evening prevented them from applying the top sealant and striping today.  So the job is half finished.  The good news is, we can park and access the lot tonight and tomorrow, the asphalt has hardened enough to accept weight.  Since tomorrow is a little iffy weather-wise, they are going to come back on Sunday to finish.  That means we'll need cars back out Sunday and probably Monday morning.  I'm really sorry for the ongoing inconvenience of this project.  Hopefully in a few days it will be behind us.

\nIn summary - you are free to park and access the parking lot now and tomorrow.  It will need to be car free Sunday by 9am.

\nOne positive note, they will be striping the spaces a little bigger which will making getting in and out of your space a little easier!

\nThanks all!
\n-Jolena")

Content.create(:parent_id => parent.id, :user_id => user2.id,
:description => "Thank you, Jolena.
\nNo apologies are necessary!!!")

Content.create(:parent_id => parent.id, :user_id => user4.id,
:description => "Sorry - there was supposed to be more to this message!  The yellow paint needs to dry for about an hour so if you plan to park in back tonight I'd give it until about 7:30 or 8pm just to be sure.

Thanks everyone for flexibility and understanding!
-Jolena")