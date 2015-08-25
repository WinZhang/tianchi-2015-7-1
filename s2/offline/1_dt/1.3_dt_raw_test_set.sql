-- |-----------|--17---|--18---|
-- |<- train ->|-label-|
-- |<-      test     ->|-validate-|

-- ## 测试集 test_set
-- 
-- drop table if exists offline_raw_test_set;
-- create table offline_raw_test_set
--     as select user_id, item_id, behavior_type, user_geohash, item_category, time
--     from tianchi_lbs.tianchi_mobile_recommend_train_user
--     where time<"2014-12-18 00"
-- ;

-- ##测试子集 test_sub_set
drop table if exists offline_raw_test_sub_set;
create table offline_raw_test_sub_set
    as select a.user_id, a.item_id, a.behavior_type, a.user_geohash, a.item_category, a.time
    from 
        (
        select * 
        from 
            offline_raw_test_set
        ) a
        
        join 
        (
        select distinct item_id
        from
            tianchi_lbs.tianchi_mobile_recommend_train_item
        ) b
        on a.item_id = b.item_id
;
