1. What is PostgreSQL?
PostgreSQL হল একটি ডেটাবেইস ম্যানেজমেন্ট সিস্টেম সহজভাবে বলতে গেলে এমন একটা সফটওয়্যার যেখানে আমরা তথ্য সংরক্ষন, খোঁজা, আপডেট ও ডিলিট করতে পারি। উদাহরনস্বরূপ, আমি একটি বন্যপ্রাণীর তথ্য সংরক্ষণ করতে চাই তার জন্য আমাদের PostgreSQL একটি টেবিল বানাতে হবে যার নাম হবে species। আমরা চাইলে তথ্য গুলো পরে দেখতে, আপডেট বা ডিলিট করতে পারবো। 

create table species(
    id serial primary key,
    name text,
    status text
);
insert into species(name,status) values('Tiger', 'Endangered');

2. What is the purpose of a database schema in PostgreSQL?
Schema হলো ডেটাবেইসের ভিতরে রাখা আলাদা একটা অংশ বা ফোল্ডার যেখানে টেবিল, ডেটা ইত্যাদি গুছিয়ে রাখা হয়। যেমন আপনি  আপনার  ঘরে  আলাদা আলাদা ড্রয়ার  রাখেন- একটা তে জামা, একটা তে কাগজ , একটা তে বই ইত্যাদি তেমন এই ডেটাবেইস এ schema মানে একটা ড্রয়ার , যেখানে একই ধরণের তথ্য রাখা হয়। 
কেন দরকার -
-ডেটা গুছিয়ে রাখতে 
-একই নামে টেবিল রাখতে (ভিন্ন schema -তে )
-ভিন্ন ভিন্ন পারমিশন দিতে ইত্যাদি। 

3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
