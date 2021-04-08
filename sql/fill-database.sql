SET IDENTITY_INSERT gomud..rooms ON
INSERT INTO gomud..rooms (id, [name], [description]) VALUES 
(1, 'The Beginning', 'This is where everything starts from'),
(2, 'The End', 'You have reached the end of the world')
SET IDENTITY_INSERT gomud..rooms OFF

INSERT INTO gomud..connections (room_id, neighbour_id, dir, two_way) VALUES
(1, 2, 2, 1)
