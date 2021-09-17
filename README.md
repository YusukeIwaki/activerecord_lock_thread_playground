# Playground of `ActiveRecord::TestFixtures`

## Without ActiveRecord::TestFixtures

* `User.create!` is actually committed.
* Created users can be seen in any test processes.

```
$ bundle exec ruby app_test.rb 4001 & bundle exec ruby app_test.rb 4002 & bundle exec ruby app_test.rb 4003 & bundle exec ruby app_test.rb 4004 & bundle exec ruby app_test.rb 4005

 (...)

D, [2021-09-17T11:54:40.562593 #65389] DEBUG -- :   User Load (36.7ms)  SELECT `users`.* FROM `users`
D, [2021-09-17T11:54:40.578269 #65389] DEBUG -- :    (6.7ms)  SELECT COUNT(*) FROM `users`
D, [2021-09-17T11:54:40.578313 #65388] DEBUG -- :   User Destroy (36.5ms)  DELETE FROM `users` WHERE `users`.`id` IN (5710, 5712, 5714, 5717, 5720, 5725, 5730, 5735, 5740, 5745, 5749, 5754, 5759, 5763, 5769, 5773, 5779, 5785, 5792, 5796, 5801, 5805, 5812, 5817, 5823, 5829, 5833, 5837, 5842, 5845, 5851, 5856, 5861, 5866, 5871, 5876, 5881, 5885, 5891, 5895, 5900, 5905, 5910, 5915, 5921, 5929, 5934, 5938, 5941, 5944, 5950, 5958, 5963, 5968, 5973, 5978, 5983, 5987, 5992, 5999, 6002, 6009, 6013, 6018, 6022, 6025, 6029, 6034, 6039, 6045, 6050, 6056, 6062, 6067, 6072, 6077, 6081, 6089, 6094, 6101, 6105, 6109, 6114, 6119, 6124, 6129, 6134, 6139, 6144, 6148, 6155, 6159, 6163, 6167, 6172, 6176, 6181, 6185, 6189, 6193)
- Gracefully stopping, waiting for requests to finish
=== puma shutdown: 2021-09-17 11:54:40 +0900 ===
- Goodbye!
F

Finished in 3.896206s, 0.2567 runs/s, 0.2567 assertions/s.

  1) Failure:
AppTest#test_get_users [app_test.rb:21]:
Expected: 100
  Actual: 400

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
D, [2021-09-17T11:54:40.644376 #65389] DEBUG -- :   User Destroy (23.5ms)  DELETE FROM `users` WHERE `users`.`id` IN (5716, 5719, 5723, 5727, 5731, 5738, 5741, 5746, 5751, 5755, 5761, 5766, 5775, 5780, 5784, 5790, 5797, 5802, 5806, 5810, 5815, 5821, 5826, 5832, 5838, 5843, 5849, 5854, 5857, 5862, 5867, 5874, 5883, 5888, 5894, 5896, 5901, 5908, 5914, 5918, 5923, 5926, 5931, 5936, 5942, 5947, 5953, 5956, 5959, 5964, 5970, 5974, 5979, 5984, 5988, 5993, 5996, 6004, 6006, 6010, 6017, 6023, 6030, 6033, 6038, 6043, 6046, 6053, 6057, 6061, 6065, 6071, 6076, 6082, 6086, 6091, 6095, 6098, 6103, 6108, 6113, 6118, 6123, 6128, 6133, 6137, 6143, 6146, 6151, 6156, 6161, 6166, 6170, 6175, 6180, 6184, 6188, 6191, 6195, 6199)
- Gracefully stopping, waiting for requests to finish
=== puma shutdown: 2021-09-17 11:54:40 +0900 ===
- Goodbye!
F

Finished in 3.866484s, 0.2586 runs/s, 0.2586 assertions/s.

  1) Failure:
AppTest#test_get_users [app_test.rb:21]:
Expected: 100
  Actual: 300

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
D, [2021-09-17T11:54:40.674711 #65385] DEBUG -- :   User Load (17.5ms)  SELECT `users`.* FROM `users`
[3]-  Exit 1                  bundle exec ruby app_test.rb 4003
[4]+  Exit 1                  bundle exec ruby app_test.rb 4004
D, [2021-09-17T11:54:40.686283 #65385] DEBUG -- :    (6.8ms)  SELECT COUNT(*) FROM `users`
D, [2021-09-17T11:54:40.702089 #65386] DEBUG -- :   User Load (18.9ms)  SELECT `users`.* FROM `users`
D, [2021-09-17T11:54:40.716221 #65386] DEBUG -- :    (8.4ms)  SELECT COUNT(*) FROM `users`
D, [2021-09-17T11:54:40.738346 #65385] DEBUG -- :   User Destroy (22.8ms)  DELETE FROM `users` WHERE `users`.`id` IN (5724, 5729, 5734, 5739, 5744, 5748, 5757, 5764, 5768, 5772, 5777, 5782, 5788, 5793, 5798, 5803, 5809, 5814, 5819, 5824, 5828, 5836, 5841, 5847, 5853, 5858, 5863, 5868, 5872, 5879, 5884, 5889, 5892, 5898, 5904, 5907, 5913, 5917, 5922, 5930, 5935, 5940, 5946, 5949, 5954, 5962, 5965, 5971, 5976, 5981, 5989, 5995, 5998, 6001, 6005, 6012, 6015, 6021, 6027, 6032, 6036, 6041, 6047, 6051, 6054, 6059, 6066, 6070, 6075, 6080, 6085, 6090, 6096, 6100, 6107, 6112, 6116, 6121, 6125, 6130, 6135, 6140, 6145, 6150, 6153, 6158, 6164, 6171, 6174, 6178, 6182, 6186, 6190, 6194, 6196, 6198, 6201, 6203, 6205, 6207)
F- Gracefully stopping, waiting for requests to finish
=== puma shutdown: 2021-09-17 11:54:40 +0900 ===
- Goodbye!


Finished in 3.813295s, 0.2622 runs/s, 0.2622 assertions/s.

  1) Failure:
AppTest#test_get_users [app_test.rb:21]:
Expected: 100
  Actual: 200

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
YusukenoMacBook:activerecord_lock_thread_playground yusuke-iwaki $ D, [2021-09-17T11:54:40.769628 #65386] DEBUG -- :   User Destroy (19.9ms)  DELETE FROM `users` WHERE `users`.`id` IN (5721, 5726, 5732, 5737, 5743, 5750, 5753, 5758, 5762, 5767, 5771, 5776, 5781, 5786, 5789, 5794, 5799, 5804, 5808, 5811, 5816, 5820, 5825, 5830, 5835, 5840, 5846, 5850, 5855, 5859, 5864, 5869, 5873, 5877, 5880, 5886, 5893, 5899, 5903, 5906, 5911, 5916, 5919, 5924, 5927, 5932, 5939, 5945, 5951, 5957, 5961, 5967, 5972, 5977, 5982, 5985, 5991, 6003, 6007, 6014, 6019, 6024, 6028, 6035, 6042, 6048, 6052, 6058, 6063, 6068, 6073, 6078, 6083, 6087, 6092, 6097, 6099, 6104, 6110, 6115, 6120, 6126, 6132, 6136, 6141, 6149, 6152, 6157, 6165, 6169, 6177, 6183, 6187, 6192, 6197, 6200, 6202, 6204, 6206, 6208)
- Gracefully stopping, waiting for requests to finish
=== puma shutdown: 2021-09-17 11:54:40 +0900 ===
F- Goodbye!


Finished in 4.014370s, 0.2491 runs/s, 0.2491 assertions/s.

  1) Failure:
AppTest#test_get_users [app_test.rb:21]:
Expected: 100
  Actual: 200

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
```


## With TestFixtures

* `BEGIN TRANSACTION` / `ROLLBACK` is automatically inserted
* `User.create!` is not committed.
* Created users cannot be seen in other test processes.

```
$ bundle exec ruby app_test_with_test_fixtures.rb 4001 & bundle exec ruby app_test_with_test_fixtures.rb 4002 & bundle exec ruby app_test_with_test_fixtures.rb 4003 & bundle exec ruby app_test_with_test_fixtures.rb 4004 & bundle exec ruby app_test_with_test_fixtures.rb 4005

 (...)

D, [2021-09-17T11:53:22.554565 #65282] DEBUG -- :   User Load (4.5ms)  SELECT `users`.* FROM `users`
D, [2021-09-17T11:53:22.562511 #65281] DEBUG -- :   User Load (6.4ms)  SELECT `users`.* FROM `users`
D, [2021-09-17T11:53:22.571942 #65279] DEBUG -- :    (21.1ms)  SELECT COUNT(*) FROM `users`
D, [2021-09-17T11:53:22.581740 #65282] DEBUG -- :    (13.5ms)  SELECT COUNT(*) FROM `users`
- Gracefully stopping, waiting for requests to finish
=== puma shutdown: 2021-09-17 11:53:22 +0900 ===
- Goodbye!
- Gracefully stopping, waiting for requests to finish
=== puma shutdown: 2021-09-17 11:53:22 +0900 ===
- Goodbye!
D, [2021-09-17T11:53:22.594281 #65281] DEBUG -- :    (28.4ms)  SELECT COUNT(*) FROM `users`
- Gracefully stopping, waiting for requests to finish
=== puma shutdown: 2021-09-17 11:53:22 +0900 ===
- Goodbye!
D, [2021-09-17T11:53:22.605563 #65280] DEBUG -- :   TRANSACTION (25.7ms)  ROLLBACK
.

Finished in 2.729461s, 0.3664 runs/s, 0.3664 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
D, [2021-09-17T11:53:22.615530 #65279] DEBUG -- :   TRANSACTION (22.1ms)  ROLLBACK
.

Finished in 2.725079s, 0.3670 runs/s, 0.3670 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
D, [2021-09-17T11:53:22.618133 #65282] DEBUG -- :   TRANSACTION (15.3ms)  ROLLBACK
.

Finished in 2.691238s, 0.3716 runs/s, 0.3716 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
D, [2021-09-17T11:53:22.641605 #65283] DEBUG -- :   TRANSACTION (8.5ms)  ROLLBACK
.

Finished in 2.727722s, 0.3666 runs/s, 0.3666 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
[1]   Done                    bundle exec ruby app_test_with_test_fixtures.rb 4001
[2]   Done                    bundle exec ruby app_test_with_test_fixtures.rb 4002
[4]+  Done                    bundle exec ruby app_test_with_test_fixtures.rb 4004
D, [2021-09-17T11:53:22.712366 #65281] DEBUG -- :   TRANSACTION (6.7ms)  ROLLBACK
.

Finished in 2.790535s, 0.3584 runs/s, 0.3584 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
[3]+  Done                    bundle exec ruby app_test_with_test_fixtures.rb 4003
```
