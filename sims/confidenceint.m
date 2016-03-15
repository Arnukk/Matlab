function [mu, upper, lower]= confidenceint(X)
    alpha=0.05;
    % Computes the confidence interval for a sample mean with the probability of
    % 100(1 - alpha)%. Confidance intervals are of the form:
    %   [X_n - q_alpha \sqrt{S_n^2/n}, X_n + q_alpha \sqrt{S_n^2/n}]
    % where X_n is the sample mean, S_n^2 is the sample variance and q_alpha is the
    % percentile of Student's t-distribution.
    %
    % Arguments:
    %   - X (R^n): population sample
    %   - alpha (float): confidence level of the interval
    %   - emean (float): the exact mean of the population
    %
    % Returns:
    %   - [lower, upper]: the boundaries of the interval
    %   - mu: the computed mean
    %
    % Usage:
    %   [l, u, mu] = confidenceint(rand(100, 1), 0.05);
    %
    % Copyright Alexandru Fikl <alexfikl@gmail.com> (c) 2012

    % needed values
    sigma = var(X);                 % variance
    n = length(X);                  % length
    q = tinv(1 - alpha/2, n - 1);   % quantile

    mu = mean(X);
    lower = mu - q * sqrt(sigma / n);
    upper = mu + q * sqrt(sigma / n);

