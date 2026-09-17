% Simulated IMU tilt angle over time
t = 0:0.1:10;  % Time from 0 to 10s
tilt_angle = 5 + 2*sin(t);  % Simulated tilt angle (normal walking)
tilt_angle(70:end) = 35;    % Simulate sudden fall at t = 7s

% Plot the tilt angle over time
figure;
plot(t, tilt_angle, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Tilt Angle (degrees)');
title('IMU Tilt Angle Simulation');
grid on;

% Fall detection logic
threshold = 30; % Fall threshold (degrees)
fall_detected = tilt_angle > threshold;

if any(fall_detected)
    disp('FALL DETECTED! Trigger Emergency Stop');
end