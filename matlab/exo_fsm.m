function exo_fsm1()
    state = "STANDING"; % Initial state
    imu_motion = true;  % Simulated IMU data
    force_drop = false; % Force sensor data (detects falls)

    while true
        switch state
            case "STANDING"
                if imu_motion
                    state = "WALKING";
                end
            
            case "WALKING"
                disp("Assisting User...");
                if ~imu_motion
                    state = "STANDING";
                elseif force_drop
                    state = "EMERGENCY_STOP";
                end
            
            case "EMERGENCY_STOP"
                disp("Emergency Stop Activated!");
                return;
        end
        pause(1); % Simulate real-time operation
    end
end

exo_fsm1(); % Run the FSM simulation