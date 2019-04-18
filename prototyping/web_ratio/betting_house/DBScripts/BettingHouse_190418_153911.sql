-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_id`  integer;
alter table `group`   add index fk_group_module_2 (`module_id`), add constraint fk_group_module_2 foreign key (`module_id`) references `module` (`id`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_id`  integer;
alter table `user`   add index fk_user_group_2 (`group_id`), add constraint fk_user_group_2 foreign key (`group_id`) references `group` (`oid`);


