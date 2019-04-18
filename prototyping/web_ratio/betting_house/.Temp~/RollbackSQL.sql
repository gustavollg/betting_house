-- User_Group [User2Group_Group2User]
alter table `user_group`   drop foreign key `fk_user_group_group`;
alter table `user_group`   drop foreign key `fk_user_group_user`;
drop table `user_group`;
-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`   drop foreign key `fk_user_group`;
alter table `user`  drop column  `group_id`;
-- Group_Module [Group2Module_Module2Group]
alter table `group_module`   drop foreign key `fk_group_module_module`;
alter table `group_module`   drop foreign key `fk_group_module_group`;
drop table `group_module`;
-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`   drop foreign key `fk_group_module`;
alter table `group`  drop column  `module_id`;
-- Team [ent7]
drop table `team`;
-- Odd [ent3]
drop table `odd`;
-- Transaction [ent2]
drop table `transaction`;
-- Notification [ent19]
drop table `notification`;
-- Event [ent16]
drop table `event`;
-- Bet [ent15]
drop table `bet`;
-- Sport [ent1]
drop table `sport`;
-- User [User]
drop table `user`;
-- Module [Module]
drop table `module`;
-- Group [Group]
drop table `group`;
