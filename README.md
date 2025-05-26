১। What is PostgreSQL?

PostgreSQL (সাধারণত "Postgres" নামে বহুল পরিচিত) এটা হলো একটি শক্তিশালী, উন্মুক্ত রিলেশনাল ডেটাবেস ম্যানেজমেন্ট  (RDBMS)। 

ওপেন সোর্স: একটি ওপেন সোর্স software, যার অর্থ হলো এর সোর্স কোড বিনামূল্যে পাওয়া যায় এবং যে কেউ এটি ব্যবহার, পরিবর্তন ও বিতরণ করতে পারে। এর ফলে একটি শক্তিশালী কমিউনিটি এটিকে নিয়মিত upgrade করে থাকে ।

রিলেশনাল এবং অবজেক্ট-রিলেশনাল:  একটি শুধু রিলেশনাল ডেটাবেসই নয়, এটি একটি Object Relational Database System (ORDBMS)। এর মানে হলো এটি রিলেশনাল relational মডেলের পাশাপাশি Object Oriented.  যেমন Inheritance, Function overloading ইত্যাদি সমর্থন করে।

SQL Compliance: Structured Query Language(SQL) standard এর মত কাজ করতে পারে। SQL ব্যবহার করে ডেটা তৈরি, পুনরুদ্ধার, আপডেট এবং মুছে ফেলা যায়।

ফিচার সমৃদ্ধি: এটি ACID (Atomicity, Consistency, Isolation, Durability) Properti সমর্থন করে, যা ডেটা লেনদেনের নির্ভরযোগ্যতা বারায় । এছাড়াও, এটি JSON এবং JSONB ডেটা টাইপ ববাবহার করতে পারে ।

ব্যবহার ক্ষেত্র: ওয়েব অ্যাপ্লিকেশন, মোবাইল অ্যাপ্লিকেশন, ডেটা ওয়্যারহাউস সহ বিভিন্ন ধরণেরApploication  এবং সিস্টেমে এটি ব্যাপকভাবে ব্যবহৃত হয়। অনেক বড় প্রতিষ্ঠান এবং ওয়েবসাইট তাদের ডেটাবেস হিসেবে PostgreSQL ব্যবহার করে।

What is the purpose of a database schema in PostgreSQL?
PostgreSQL-এ ডেটাবেস schema হলো একটি ডেটাবেসের মধ্যে Object গুলোকে (যেমন: টেবিল, ভিউ, ফাংশন, Index ইত্যাদি) Logical রাখার একটি উপায়। সহজভাবে বললে, এটি একটি ডেটাবেসের মধ্যে একটি Container বা Folder এর মতো কাজ করে।




২/ What is the difference between the VARCHAR and CHAR data types?
CHAR এবং VARCHAR উভয়ই SQL-এ character string (text data) সংরক্ষণের জন্য use ডেটা টাইপ, কিন্তু এদের মধ্যে কিছু মৌলিক পার্থক্য রয়েছে যা ডেটাবেস ডিজাইন এবং performance এ প্রভাব ফেলে। 

CHAR: ডেটা টাইপ একটি নির্দিষ্ট দৈর্ঘ্যের  character string store করে।

VARCHAR: ডেটা টাইপ একটি পরিবর্তনশীল দৈর্ঘ্যের (variable-length) character string storeকরে |


৩/ Explain the Primary Key and Foreign Key concepts in PostgreSQL.

Primary Key একটি টেবিলের প্রতিটি সারির (row) জন্য একটি অনন্য শনাক্তকারী (unique identifier) হিসেবে কাজ করে। এর প্রধান উদ্দেশ্য হলো টেবিলের প্রতিটি সারিকে মৌলিক হিসাবে   চিহ্নিত করা।

Foreign Key একটি টেবিলের কলাম বা কলামগুলোর সেট যা অন্য একটি টেবিলের Primary Key কলামকে নির্দেশ করে। এর প্রধান উদ্দেশ্য হলো দুটি টেবিলের মধ্যে একটি সম্পর্ক স্থাপন করা এবং Referential Integrity নিশ্চিত করা।



4/ Explain the purpose of the WHERE clause in a SELECT statement.

SELECT স্টেটমেন্টে এ WHERE clause এর প্রধান উদ্দেশ্য হলো ডেটাবেস থেকে যে ডেটাগুলো retrieve করা হবে, সেগুলোকে নির্দিষ্ট শর্ত অনুযায়ী ফিল্টার করা।

৫/ What are the LIMIT and OFFSET clauses used for?

LIMIT clause প্রধান কাজ হলো একটি SELECT statement এর ফলাফল সেট থেকে সর্বোচ্চ কতগুলো rows ফেরত দেওয়া হবে তা mention করে। 

OFFSET clause প্রধান কাজ হলো  ফলাফল সেট থেকে শুরু করার আগে কতগুলো row বাদ দেওয়া হবে তা নির্দিষ্ট করা।

