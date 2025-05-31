function evaluate_sep_metrics(metrics)
    energy = [metrics.energy];
    alive = [metrics.alive];
    
    figure;
    subplot(2,1,1); plot(energy, 'LineWidth', 2);
    title('Total Energy Over Rounds'); ylabel('Energy'); xlabel('Round');

    subplot(2,1,2); plot(alive, 'LineWidth', 2);
    title('Alive Nodes Over Rounds'); ylabel('Alive Nodes'); xlabel('Round');
end
