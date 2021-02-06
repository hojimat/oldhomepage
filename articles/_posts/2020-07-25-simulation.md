---
layout: post
title: Simulations in economics
lang: english
categ: article
description: This article talks about simulation as a research tool for the economists, how it allows for weaker assumptions, bounded rationality and high complexity.
keywords: simulation, economics, agent-based modeling, abm 
tags: economics
image: /assets/img/simulation/simulation.png
---

### Contents
<ul class="index">
<li><a href="#intro">1. Introduction</a></li>
<li><a href="#recap">2. Recap</a></li>
<li><a href="#applications">3. Applications</a></li>
<li><a href="#discussion">4. Discussion</a></li>
<li><a href="#conclusion">5. Conclusion</a></li>
</ul>


<a name="intro"></a><br>
## 1. Introduction

Simulation, as a research approach in economics, is not as popular as analytical, empirical, or experimental methods. This article provides an expositive summary of the simulation as a research tool, its strengths and weaknesses, and how it can be used in economic research. 

<a name="recap"></a><br>
## 2. Recap

First of all, let's recap the various approaches in economic research. Analytical approach tries to find a mathematical formulation of a phenomenon to understand and/or predict it. Empirical approach uses real-world data to explore the phenomenon. The following example illustrates the difference.

### 2 a. Chessboard example
Imagine a chessboard with a king on the cell `a1`. Every minute, the king moves one cell up and one cell right. What will be the location of the king after 5 minutes?

- Analytical solution identifies that at minute _t_, the king is on the cell denoted by _t_'th letter of the alphabet and number _t_:

<img class="img-fluid mx-auto d-block w-50" src="/assets/img/simulation/formula.png"/>

Plugging in _t=1+5=6_ into the equation gives the location of the king after 5 minutes as `f6`.


- Empirical solution observes the king for the first 3 minutes and extrapolates a pattern.

<img class="img-fluid mx-auto d-block w-50" src="/assets/img/simulation/curve.png"/>

Fitting the curve, it forecasts the location of the king after 5 minutes as `f6`.

- Simulation, on the other hand, does not make any assumptions or estimations --- it takes the initial location parameter `a1` and the update rule "1-up-1-right" and runs it in a computer for 5 periods as follows:

<figure class="figure text-center">
<img class="figure-img img-fluid w-50" src="/assets/img/simulation/chess1.svg"/>
<figcaption>Research interest: location of a white king given a starting position and a movement rule</figcaption>
</figure>

The advantage of simulations becomes clearer when we consider more complex problems. Imagine a chessboard with the following pieces and movement rules:

1. white king on `a1`: moves 1-up if it is on a black cell and 1-right if it is on a white cell
2. black bishop  on `c8`: moves 1-right-1-down 
3. white knight on `h1`: moves 2-left-1-down if it is on a black cell and 2-up-1-left if it is on a white cell
4. black bishop  on `f8`: moves 1-left-1-down 
5. capture is required if possible
6. each piece performs one move per period

What is the state of the chessboard after 3 periods?

<figure class="figure text-center">
<img class="figure-img img-fluid w-50" src="/assets/img/simulation/chess2.svg"/>
<figcaption>Research interest: state of the world given population, starting positions, and movement rules</figcaption>
</figure>

Analytical model gets complicated even at this very simplified special case of a chess game. Empirical models can help only in presence of the relevant data. Simulation comes handy in this type of problems because it does not look for a solution or estimation --- it simply runs the game and sees what happens. In fact, this is how chess engines work.

--- 

A similar example is Rubik's cube --- it is possible to provide an analytical explanation of what a 3-move combination does, but it is very difficult to grasp what a 12-move combination does --- that's why the usual way to understand the combinations is by starting from a completed cube and actually performing the moves and seeing the results after the fact, which is exactly what simulation does. Let's take a look at another example, this time from economics.

### 2 b. One-time investment

Imagine a stylized scenario, when you are 25 years old and have 1,000$ and want to make a one-time investment for your retirement at 65. You have two options: invest immediately at 5% annual interest rate or invest at age of 35 at 7% annual interest rate. In the absence of discounting and any kind of time preference, which investment will you choose?

- Analytical solution uses a compound interest rate formula to compare the values:

<img class="img-fluid mx-auto d-block w-50" src="/assets/img/simulation/compound.png"/>

- Empirical approach surveys 100 people who invested in either option and asks their wealth at retirement.
- Simulation codes a program, where two hypothetical scenarios take place and compares the results:

<img class="img-fluid mx-auto d-block w-50" src="/assets/img/simulation/investment.png"/>

Simulation focuses on the evolution of portfolio through time as much as it focuses on its value at retirement. In the above example we can see that the first investment option is better until 60 years and worse after age 60. However, the real advantage of using simulations can be realized when analyzing a more realistic situation, when you make investment contributions every month of your life and the portfolio values change with the economy and stock markets. In this situation, analytical solution gets extremely complicated, and the portfolio choice is better analyzed using simulations. Below is one example of how simulations make life-cycle investment analysis easier in case of multiple stocks changing at the same time.

---

### 2 c. Confidence interval

Consider two random variables _A_ and _B_. _A_ is normally distributed around 5 with standard deviation 10, and _B_ is normally distributed around 3 with standard deviation 5. What is the confidence interval of _A+B_?

We can get into joint distributions or use theorems to solve the problem, but there is another way --- to perform a simulation with 10,000 scenarios, where in each scenario we draw values from the distributions of _A_ and _B_ and sum them:

<img class="img-fluid mx-auto d-block w-100" src="/assets/img/simulation/confint.png"/>

Using simulations, we have obtained a new variable _A+B_ with one mean and one variance instead of original two. Thus, we can calculate the confidence interval from the resulting data, without having to use multivariate probability theory. The advantage becomes clearer when we want products or other nonlinear combinations of the two random variables. 

---

The examples above illustrate two important characteristics of simulations: _(a)_ they allow to study not only the results, but also the evolution of states leading to the results, and _(b)_ they allow for higher complexity in problem formulations. The latter comes from the fact that simulations do not require a solution, and simply implement the process given the initial parameters and the rules. Before we proceed to the discussion of the methodology, let's take a look at the actual research that employs simulations.

<a name="applications"></a><br>
## 3. Applications

Reading the previous section might give a false impression of a strict choice among different research tools. However, actual simulation studies heavily involve both analytical and empirical aspects, as can be seen below.

### 3 a. Portfolio selection

An individual wants to choose among different [life-cycle investment](https://www.investopedia.com/terms/l/life_cycle_funds.asp) strategies for the retirement. The decision is to allocate funds to stocks and bonds. The candidates are listed below:

1) Markowitz : a classical investment rule in financial economics --- to invest the following percentage of the funds in stocks:

<img class="img-fluid mx-auto d-block w-25" src="/assets/img/simulation/markowitz.png"/>

2) _(100-age)%_ : invest _(100 - age)%_ of the funds in stocks, and the rest of funds in bonds --- this has been a usual (empirically obtained) advice by financial consultants of the second half of the 20th century.

3) Cocco et al. : an upgrade to the previous rule --- a rule to invest the following ratio of funds in stocks:

<img class="img-fluid mx-auto d-block w-50" src="/assets/img/simulation/cocco.png"/>

where _t_ is age of an investor. This heuristic has been obtained from series of dynamic optimizations (speaking of analytical aspects of a simulation study).

The following graph illustrates the ratio of funds to be invested in stocks for different ages:

<img class="img-fluid mx-auto d-block w-50" src="/assets/img/simulation/strategies.png"/>

The law of motion of the capital follows the following dynamic:

<img class="img-fluid mx-auto d-block w-100" src="/assets/img/simulation/motion.png"/>

where _w<sub>t</sub>_ is the wage of the individual at time _t_, _c_ is the portion of the wage allocated for investment, and _r<sub>p</sub>_ is the rate of return of the portfolio of choice.

Regardless of the portfolio choice, the following processes happen in the background: wages change throughout lifetime (at different rates for different individuals), stock prices change depending on an economic situation.

Moreover, calculating the final capital is not enough for a comprehensive comparison --- we have to take into account the individual characteristics like risk aversion, steepness of the earnings curve, and the industry at which the individual works.

This model contains too many moving parts to try to solve it analytically. Even the calculation of the confidence intervals is very difficult, because there are at least two sources of randomness --- labor markets and stock markets. And we didn't even include housing investment!

Simulation is very useful for this type of problems. We can approach the solution as follows:

1. Consider an 25-year-old agent that wants to invest in a pension fund.
2. Randomly generate prices for all assets in a portfolio for the whole investment timespan (40 years in this example) from the given distributions (calibrated from the historical data).
3. Calculate portfolio values according to the generated state.
3. Let the agent invest in 3 portfolios and observe the funds until age 65.
5. Repeat the above steps _N=10,000_ times.

The resulting data can be used to test different insights --- from observing mean and variation across scenarios to comparing the relative frequency of preferences. Below we present just one of the possible results of the simulation --- how frequent one portfolio is better than the other:

<img class="img-fluid mx-auto d-block w-75" src="/assets/img/simulation/results.png"/>
 
As you can see, simulations work really well for comparing different scenarios, as the values themselves are not informative.

---

### 3 b. Battle of the sexes 
laksjdflkj allows for modeling agents one to one or whatever.
repeated prisoner's dilemma
no strategic behavior just adaptation
collect probabiliites and act with mixed strategies
important: the whole concept of the problem changes, so they are not substitutes for analytical problem - be careful

<img class="img-fluid mx-auto d-block w-50" src="/assets/img/simulation/payoffs.png"/>

without coordination


<a name="discussion"></a><br>
## 4. Discussion

Really good for comparison. simulation is constructed by you, so no surprises. if there is any surprise then it is either due to complexity, or because you made a mistake in a code. so without comparison, doesn't really mean anything.

why video games do it and we cannot make macro models right now? because of repetitions


good for sensitivities.

Focus is on state and emergence and evolution , not only on results.


simulation should not be surprising for easy scenarios

djk jl known as "monte carlo" law of large numbers

you can make it as difficult as you want.
In relationship to data, analytical uses calibration, empirical uses estimation, and simulation generates data.
simulation is complementary to analytical and empirical approaches. we can use munk formula with calibrated parameters and simulate the results.
put codes somewhere

Simulation is useless in presence of data or a good analytical model; simulation is a form of escapism and does not solve any problem , just observes; it is best for the comparison of scenarios and to learn newinsights
<a name="conclusion"></a><br>
## 5. Conclusion

really good for comparison. a little bit useless for one scenario. good for experimenting AND CREATING HYPOTHESES.
