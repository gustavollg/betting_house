-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `name`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `id`  integer  not null,
   `moduleid`  varchar(255),
   `name`  varchar(255),
  primary key (`id`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `email`  varchar(255),
   `password`  varchar(255),
   `coins`  double precision,
   `username`  varchar(255),
  primary key (`oid`)
);


-- Bet [ent15]
create table `bet` (
   `id`  integer  not null,
   `winningbet`  double precision,
   `userbet`  double precision,
   `valuebet`  double precision,
  primary key (`id`)
);


-- Event [ent16]
create table `event` (
   `id`  integer  not null,
   `information`  longtext,
   `isrestricted`  bit,
   `isopen`  bit,
  primary key (`id`)
);


-- Notification [ent19]
create table `notification` (
   `id`  integer  not null,
   `isactive`  bit,
  primary key (`id`)
);


-- Transaction [ent2]
create table `transaction` (
   `id`  integer  not null,
   `coins`  varchar(255),
  primary key (`id`)
);


-- Odd [ent3]
create table `odd` (
   `id`  integer  not null,
   `odd`  double precision,
   `points`  integer,
  primary key (`id`)
);


-- Sport [ent4]
create table `sport` (
   `id`  integer  not null,
   `name`  varchar(255),
  primary key (`id`)
);


-- Team [ent7]
create table `team` (
   `id`  integer not null auto_increment,
   `name`  varchar(255),
  primary key (`id`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_id`  integer;
alter table `group`   add index fk_group_module (`module_id`), add constraint fk_group_module foreign key (`module_id`) references `module` (`id`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_id`  integer not null,
   `module_id`  integer not null,
  primary key (`group_id`, `module_id`)
);
alter table `group_module`   add index fk_group_module_group (`group_id`), add constraint fk_group_module_group foreign key (`group_id`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_id`), add constraint fk_group_module_module foreign key (`module_id`) references `module` (`id`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_id`  integer;
alter table `user`   add index fk_user_group (`group_id`), add constraint fk_user_group foreign key (`group_id`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_id`  integer not null,
   `group_id`  integer not null,
  primary key (`user_id`, `group_id`)
);
alter table `user_group`   add index fk_user_group_user (`user_id`), add constraint fk_user_group_user foreign key (`user_id`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_id`), add constraint fk_user_group_group foreign key (`group_id`) references `group` (`oid`);


-- Transaction_User [rel2]
alter table `transaction`  add column  `user_id`  integer;
alter table `transaction`   add index fk_transaction_user (`user_id`), add constraint fk_transaction_user foreign key (`user_id`) references `user` (`oid`);


-- BetEvent [rel20]
alter table `bet`  add column  `event_id`  integer;
alter table `bet`   add index fk_bet_event (`event_id`), add constraint fk_bet_event foreign key (`event_id`) references `event` (`id`);


-- NotificationEvent [rel22]
alter table `notification`  add column  `id_event`  integer;
alter table `notification`   add index fk_notification_event (`id_event`), add constraint fk_notification_event foreign key (`id_event`) references `event` (`id`);


-- Event_Odd [rel4]
alter table `odd`  add column  `event_id`  integer;
alter table `odd`   add index fk_odd_event (`event_id`), add constraint fk_odd_event foreign key (`event_id`) references `event` (`id`);


-- Odd_Team [rel5]
alter table `odd`  add column  `team_id`  integer;
alter table `odd`   add index fk_odd_team (`team_id`), add constraint fk_odd_team foreign key (`team_id`) references `team` (`id`);


-- Bet_User [rel6]
alter table `bet`  add column  `user_id`  integer;
alter table `bet`   add index fk_bet_user (`user_id`), add constraint fk_bet_user foreign key (`user_id`) references `user` (`oid`);


-- Notification_User [rel7]
alter table `notification`  add column  `user_id`  integer;
alter table `notification`   add index fk_notification_user (`user_id`), add constraint fk_notification_user foreign key (`user_id`) references `user` (`oid`);


-- Sport_Event [rel9]
alter table `event`  add column  `sport_id`  integer;
alter table `event`   add index fk_event_sport (`sport_id`), add constraint fk_event_sport foreign key (`sport_id`) references `sport` (`id`);


