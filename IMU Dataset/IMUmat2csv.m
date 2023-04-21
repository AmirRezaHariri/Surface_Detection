for person = 1:30 % max 30
    cell = struct2cell(data);
    cell = struct2cell(cell{person});
    for trial = 1:57 % max 57
        for sensor = 1:6 % max 6 
            addr = sprintf('"D:\\Documents\\Codes\\Projects\\Surface Detection\\IMU Dataset\\Data\\person%d_trial%d_sensor%d.csv', person, trial, sensor);
            table = cell{sensor}(trial, 10:31); % max 37
            matrix = [];
            for i = 1:22 % max 37
                col = table(1, i);
                matrix = [matrix, col{1, 1}{1, 1}];
            end
            matrix = ["Acc_X", "Acc_Y", "Acc_Z", "FreeAcc_X", ...
                "FreeAcc_Y", "FreeAcc_Z", "Gyr_X", "Gyr_Y", "Gyr_Z", ...
                "Mag_X", "Mag_Y", "Mag_Z", "VelInc_X", "VelInc_Y", ...
                "VelInc_Z", "q0", "q1", "q2", "q3", "Roll", "Pitch", ...
                "Yaw"; matrix];
            writematrix(matrix, addr, 'Delimiter', ',', 'QuoteStrings', 1);
        end
    end
end