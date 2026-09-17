t = 0:1:3600; % 1-hour simulation
motor_power = 120; % Total motor power (W)
control_power = 10; % Control system power (W)

total_power = motor_power + control_power; % Total power draw
battery_capacity = 240; % Wh

energy_used = total_power * (t / 3600); % Energy consumption over time
battery_remaining = battery_capacity - energy_used;

% Plot battery discharge over time
figure;
plot(t/60, battery_remaining, 'r', 'LineWidth', 2);
xlabel('Time (minutes)');
ylabel('Battery Remaining (Wh)');
title('Battery Discharge Over 1 Hour');
grid on;