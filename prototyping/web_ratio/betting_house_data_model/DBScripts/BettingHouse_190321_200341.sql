-- Group [Group]
create table `group` (
   `id`  integer  not null,
   `name`  varchar(255),
  primary key (`id`)
);


-- Module [Module]
create table `module` (
   `id`  integer  not null,
   `name`  varchar(255),
   `group_id`  integer,
  primary key (`id`)
);


-- User [User]
create table `user` (
   `id`  integer  not null,
   `name`  varchar(255),
   `email`  varchar(255),
   `password`  varchar(255),
   `coins`  double precision,
   `group_id`  integer,
  primary key (`id`)
);


-- Notification [ent12]
create table `notification` (
   `id`  integer  not null,
   `isactive`  integer,
   `teste`  varchar(255),
  primary key (`id`)
);


-- Team [ent13]
create table `team` (
   `id`  integer not null auto_increment,
   `name`  varchar(255),
  primary key (`id`)
);


-- Bet [ent8]
create table `bet` (
   `id`  integer  not null,
   `winningbet`  double precision,
   `userbet`  double precision,
   `valuebet`  double precision,
  primary key (`id`)
);


-- Event [ent9]
create table `event` (
   `id`  integer  not null,
   `information`  longtext,
   `isrestricted`  integer,
   `goalone`  integer,
   `goaltwo`  integer,
   `oddone`  double precision,
   `oddtwo`  double precision,
   `oddthree`  double precision,
   `isopen`  integer,
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
alter table `group_module`   add index fk_group_module_group (`group_id`), add constraint fk_group_module_group foreign key (`group_id`) references `group` (`id`);
alter table `group_module`   add index fk_group_module_module (`module_id`), add constraint fk_group_module_module foreign key (`module_id`) references `module` (`id`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_id_2`  integer;
alter table `user`   add index fk_user_group (`group_id_2`), add constraint fk_user_group foreign key (`group_id_2`) references `group` (`id`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_id`  integer not null,
   `group_id`  integer not null,
  primary key (`user_id`, `group_id`)
);
alter table `user_group`   add index fk_user_group_user (`user_id`), add constraint fk_user_group_user foreign key (`user_id`) references `user` (`id`);
alter table `user_group`   add index fk_user_group_group (`group_id`), add constraint fk_user_group_group foreign key (`group_id`) references `group` (`id`);


-- BetEvent [rel11]
alter table `bet`  add column  `event_id`  integer;
alter table `bet`   add index fk_bet_event (`event_id`), add constraint fk_bet_event foreign key (`event_id`) references `event` (`id`);


-- Bet_User [rel16]
create table `bet_user` (
   `bet_id`  integer not null,
   `user_id`  integer not null,
  primary key (`bet_id`, `user_id`)
);
alter table `bet_user`   add index fk_bet_user_bet (`bet_id`), add constraint fk_bet_user_bet foreign key (`bet_id`) references `bet` (`id`);
alter table `bet_user`   add index fk_bet_user_user (`user_id`), add constraint fk_bet_user_user foreign key (`user_id`) references `user` (`id`);


-- Notification_User [rel17]
create table `notification_user` (
   `notification_id`  integer not null,
   `user_id`  integer not null,
  primary key (`notification_id`, `user_id`)
);
alter table `notification_user`   add index fk_notification_user_notificat (`notification_id`), add constraint fk_notification_user_notificat foreign key (`notification_id`) references `notification` (`id`);
alter table `notification_user`   add index fk_notification_user_user (`user_id`), add constraint fk_notification_user_user foreign key (`user_id`) references `user` (`id`);


-- EventTeam [rel8]
create table `team_has_event` (
   `event_id`  integer not null,
   `team_id`  integer not null,
  primary key (`event_id`, `team_id`)
);
alter table `team_has_event`   add index fk_team_has_event_event (`event_id`), add constraint fk_team_has_event_event foreign key (`event_id`) references `event` (`id`);
alter table `team_has_event`   add index fk_team_has_event_team (`team_id`), add constraint fk_team_has_event_team foreign key (`team_id`) references `team` (`id`);


-- NotificationEvent [rel9]
alter table `notification`  add column  `id_event`  integer;
alter table `notification`   add index fk_notification_event (`id_event`), add constraint fk_notification_event foreign key (`id_event`) references `event` (`id`);


