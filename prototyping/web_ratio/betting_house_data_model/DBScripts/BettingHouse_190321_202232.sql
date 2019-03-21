-- User [User]
alter table `user`  add column  `coins`  double precision;


-- Notification_User [rel27]
alter table `notification`  add column  `user_id`  integer;
alter table `notification`   add index fk_notification_user_2 (`user_id`), add constraint fk_notification_user_2 foreign key (`user_id`) references `user` (`id`);


-- Bet_User [rel28]
alter table `bet`  add column  `user_id`  integer;
alter table `bet`   add index fk_bet_user_2 (`user_id`), add constraint fk_bet_user_2 foreign key (`user_id`) references `user` (`id`);


