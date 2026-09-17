function pid_joint_control1()
    % Time settings
    dt = 0.01; % Time step (10ms)
    time = 0:dt:5; % Simulate for 5 seconds

    % Joint control parameters
    target_angle = 45; % Desired knee joint angle (degrees)
    current_angle = 0; % Initial angle
    kp = 1.5; ki = 0.02; kd = 0.1; % PID gains

    integral = 0;
    prev_error = 0;

    % Data storage
    angle_data = zeros(size(time));
    torque_data = zeros(size(time));

    for i = 1:length(time)
        error = target_angle - current_angle;
        integral = integral + error * dt;
        derivative = (error - prev_error) / dt;
        torque = kp * error + ki * integral + kd * derivative;
        
        % Simulate joint response (basic model)
        current_angle = current_angle + 0.5 * torque * dt;
        prev_error = error;

        % Store data
        angle_data(i) = current_angle;
        torque_data(i) = torque;
    end

    % Plot results
    figure;
    subplot(2,1,1);
    plot(time, angle_data, 'b', 'LineWidth', 2);
    xlabel('Time (s)'); ylabel('Joint Angle (deg)');
    title('PID Joint Control - Knee');
    grid on;

    subplot(2,1,2);
    plot(time, torque_data, 'r', 'LineWidth', 2);
    xlabel('Time (s)'); ylabel('Torque Output');
    title('PID Torque Response');
    grid on;
end

pid_joint_control1();