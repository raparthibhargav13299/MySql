create database dbms 
use dbms
-- Create the tables for Note, Category, Reminder, User, UserNote, NoteReminder and NoteCategory.
create table Note(
note_id char(4) primary key,
note_title varchar(20) not null,
note_content text(1000) not null,
note_status char(4) not null,
note_creation_date datetime not null
)
 create table Category(
 category_id char(4) primary key,
 category_name varchar(20) not null,
 category_descr varchar(200) not null, 
 category_creation_date datetime not null, 
 category_creator varchar(20) not null 
 )
 
 create table Reminder(
 reminder_id char(4) primary key, 
 reminder_name varchar(20) not null, 
 reminder_descr varchar(100) not null,
 reminder_type varchar(20),
 reminder_creation_date datetime not null,
 reminder_creator varchar(20) not null
 )
  create table User(
  user_id char(4) primary key, 
  user_name varchar(20) not null, 
  user_added_date datetime not null, 
  user_password varchar(15) not null check(char_length(user_password)>=10 ), 
  user_mobile varchar(10) not null check ( char_length(user_mobile)=10)
  )
  
  create table UserNote(
   usernote_id char(4) not null, 
   user_id char(4) not null,
   note_id char(4) not null,
   primary key (usernote_id),
   Foreign Key (user_id) references User (user_id) , 
   Foreign Key (note_id) references Note (note_id)
   )
   
   create table NoteReminder(
   notereminder_id char(4) primary key, 
   note_id char(4) not null, 
   reminder_id char(4) not null,
   foreign key(note_id) references Note (note_id),
   foreign key(reminder_id) references Reminder (reminder_id)
   )
   
   create table NoteCategory(
   notecategory_id char(4) primary key, 
   note_id char(4) not null, 
   category_id char(4) not null,
   foreign key(note_id) references Note(note_id),
   foreign key(category_id) references Category(category_id)
   )
   alter table Note modify column note_status varchar(20) not null 
   
-- Insert the rows into the created tables (Note, Category, Reminder, User, UserNote, NoteReminder and NoteCategory).

   insert into Note values('n001','The Hero','rohit sharma is the hero and cricketer','published',curdate())
   insert into Note values('n002','The War','war has been won by india against china over jammu and kashmir border','published',now())
   insert into Note values('n003','College','college life is full of education and enjoyment','not published',curdate())
   
   insert into Category values('c001', 'action','Awesome',curdate(),'sai')
   insert into Category values('c002','Periodic Action','Unbelieveable action',curdate(),'monish')
   insert into Category values('c003','drama','hit',curdate(),'sangeeth')
   
   insert into Reminder values('r001','shyam','calm',null,now(),'narra')
   insert into Reminder values('r002','pooja','fun','good',now(),'solanki')
   insert into Reminder values('r003','venkatesha','not null',null,now(),'sai')
   select * from Reminder
   
   insert into User values('u001','saisangeeth',curdate(),'12345678901234','9618072168')
   insert into User values('u002','Vinay',now(),'123478678901234','9515976744')
   insert into User values('u003','monish',now(),'12347678901234','9014437645')
   
   insert into UserNote values('un04','u001','n001')
   insert into UserNote values('un02','u003','n003')
   insert into UserNote values('un03','u002','n002')
   
   insert into NoteReminder values('ar04','n001','r001')
   insert into NoteReminder values('ar02','n002','r001')
   insert into NoteReminder values('ar03','n003','r003')
   
   insert into NoteCategory values('nc01','n002','c001')
   insert into NoteCategory values('nc02','n002','c002')
   insert into NoteCategory values('nc03','n003','c003')
   
   -- Fetch the row from User table based on Id and Password.
   select * from User where user_id='u002' and user_password='123478678901234'
   
  -- Fetch all the rows from Note table based on the field note_creation_date.
   select * from Note where note_creation_date=curdate()
   
  -- Fetch all the Categories created after the particular Date.
       select * from Category where category_creation_date>="2018-01-04"
       
  -- Fetch all the Note ID from UserNote table for a given User.
       select note_id from UserNote where user_id='u001' 
       
 -- Write Update query to modify particular Note for the given note Id.
        update Note set note_status='pubshiled' where note_id='n003'
        
   -- Fetch all the Notes from the Note table by a particular User.
         select * from Note where note_id = (select note_id from UserNote where user_id = 'u002')
         
   -- Fetch all the Notes from the Note table for a particular Category.
         select * from Note where note_id = (select note_id from NoteCategory where category_id = 'c001')
         
   -- Fetch all the reminder details for a given note id.
       select * from Reminder where reminder_id = (select reminder_id from NoteReminder where note_id = 'n003')
       
	-- Fetch the reminder details for a given reminder id.
        select * from Reminder where reminder_id='r003'
  
  
 -- Write a query to create a new Note from particular User (Use Note and UserNote tables - insert statement).
  delimiter //
   create trigger notetgr1
   after insert on note for each row
   begin
   insert into UserNote values('un06','u001',new.note_id);
   end
   //  delimiter ;

-- Write a query to create a new Note from particular User to particular Category(Use Note and NoteCategory tables - insert statement)

   delimiter //
   create trigger notetgr
   after insert on note for each row
   begin
   insert into UserNote values('un10','u001',new.note_id);
   insert into NoteCategory values('nc09',new.note_id,'c003');
   end
   //  delimiter ;
   
   insert into Note values('n004','quiet','be calm','not published',curdate())
   select * from Note
   select * from UserNote
   
   insert into Note values('n011','action','thriller','not published',curdate())
   select * from Note
   select * from UserNote
   select * from NoteCategory
   
  -- Write a query to set a reminder for a particular note (Use Reminder and NoteReminder tables - insert statement)
  
  delimiter //
   create trigger remindertgr
   after insert  on reminder for each row
   begin
   insert into NoteReminder values('ar05','n003',new.reminder_id);
   end;
   //
   
   insert into Reminder values('r004','sangeeth','good','single',curdate(),'sai' )
   select * from Reminder
   select * from Notereminder
   
  -- Write a query to delete particular Note added by a User(Note and UserNote tables - delete statement)
  
  delimiter //
       create trigger deletetgr1
       before delete on Note for each row
       begin
       delete from UserNote
       where note_id=old.note_id;
       end;
       //
      delete from Note where note_id='n001'
   
   select * from UserNote
   
  -- Write a query to delete particular Note from particular Category(Note and NoteCategory tables - delete statement)
  
  delimiter //
  create trigger deleteNote
  before delete on Note for each row
  begin
  delete from NoteCategory
  where note_id=old.note_id;
  end;
  //
  delete from Note where note_id='n002'
  
  -- Create a trigger to delete all matching records from UserNote, NoteReminder and NoteCategory table when :
-- 1. A particular note is deleted from Note table (all the matching records from UserNote, NoteReminder and NoteCategory should be removed automatically)

  delimiter //
 CREATE trigger deletecattrg
 before delete on Note for each row
 begin
 delete from NoteCategory
 where note_id = old.note_id;
 delete from NoteReminder
 where note_id = old.note_id;
 delete from UserNote
 where note_id = old.note_id;
 end;
 //
delete from Note
where note_id = 'n003'

-- 2. A particular user is deleted from User table (all the matching notes should be removed automatically)
  
delimiter //
CREATE trigger deleteUser
before delete on User for each row
begin
delete from UserNote
where user_id = old.user_id;
end;
//
delete from User
where user_id = 'u002'
   
   
   