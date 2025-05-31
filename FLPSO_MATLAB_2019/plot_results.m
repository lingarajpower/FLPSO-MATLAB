function plot_results(bestFitness)
    plot(bestFitness, 'LineWidth', 2);
    title('Convergence Curve');
    xlabel('Iteration');
    ylabel('Best Fitness');
    grid on;
end
