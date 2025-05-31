function evaluate_eldc_metrics(metrics)
    energy = [metrics.energy];
    alive = [metrics.alive];
    
    subplot(2,1,1); plot(energy, 'LineWidth', 2);
    title('Energy Consumption Over Rounds'); ylabel('Total Energy');

    subplot(2,1,2); plot(alive, 'LineWidth', 2);
    title('Alive Nodes Over Rounds'); ylabel('Alive Nodes');
    xlabel('Round');
end
