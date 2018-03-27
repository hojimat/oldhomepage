---
layout: post
title: I learned Factor Analysis (and more)
lang: english
description: Product of which distributions is uniform, square root of uniform distributions
---

[**To learn about product decomposition of uniform distribution click here or keep on reading**](#unifrand)


This month I worked on a [psychometric project](https://en.wikipedia.org/wiki/Psychometrics). It is interesting that I had never heard about this field before. Psychometrics, is basically statistics applied to psychology, similar to econometrics, biostatitcs etc. What is great about my economic background, though, is the rigorous mathematical and statistical background - it helped me learn the subject and contribute fairly quickly.   

The task was to design an algorithm which randomly generates correlation matrices satisfying given [factor analysis model](https://en.wikipedia.org/wiki/Factor_analysis). I finished the great textbook "Modern Factor Analysis" by Harry H. Harman and learned a lot. In a nutshell, Factor analysis is the method used to find latent common factors which underlie the given variables; once found, such factors may be used in the model as regressors, thus reducing the number of variables. Psychologists use this to evaluate various test results: 100-question test by 1000 people gives a large panel dataset. However if the test questions could be reduced to their underlying hidden factors like introversion, risk aversion, optimism etc. we could considerably simplify the analysis. After all, the measure of those traits (and **not** the test questions) is **the** purpose of psychology.  

Generating correlation matrices was easy, but generating them uniformly was a big trouble. Indeed, a product of two uniform random variables is not uniform. I have discovered a great combination of free terms for [beta distribution](https://en.wikipedia.org/wiki/Beta_distribution) to deal with this problem:

## Product decomposition of Uniform Random variables <a name="unifrand"></a>

First of all, let's recall the density plot of a uniform distribution:

<figure class="blog">
	<img src="/assets/img/factoranalysis/unif.png" alt="Uniform distribution">
	<figcaption>Uniform Distribution</figcaption>
</figure>

Unfortunately, the product of uniform distributions is not uniform and is skewed towards origin. So, I decided to find the square root of a uniform distribution. After long inquiries I found a [great proof](http://www.sci.csueastbay.edu/~esuess/classes/Statistics_6401/Handouts/trans/TransUnif.pdf) that square root of the uniform distribution is Beta(2,1) distribution.

> **Square of a Beta(2,1) distributed variable is uniformly distributed**

<figure class="blog">
	<img src="/assets/img/factoranalysis/beta21.png" alt="Beta(2,1) distribution">
	<figcaption>Beta(2,1) Distribution</figcaption>
</figure>

<figure class="blog">
	<img src="/assets/img/factoranalysis/beta21sq.png" alt="Square of Beta(2,1) distribution">
	<figcaption>Square of Beta(2,1) is Uniform</figcaption>
</figure>

Unfortunately, the product of two distinct Beta(2,1)-distributed variables was not uniform and was normally-skewed. So, the above property wasn't useful for the project. But I was inspired now - I discovered the beta distribution and wasn't going to let it go - I googled "the product of beta distributions" and found a great deal of related literature (please look it up if you are interested). 

> **Uniform distribution is equivalent to Beta(1,1) distribution**

I discovered that the product formula for two beta-distributed variables was really complex and I decided that the _rigor could be compensated for intuitiveness in this case_, after all this was statistics and not a real analysis (if you disagree, you are welcome to leave a comment with your suggestion, I would be very interested to learn your perspective). After trying to solve for the free parameters and combining this with trial-and-error, _I have finally discovered the answer!_ 

> **Product of two Beta(1.2, 0.5)-distributed variables is approximately uniform**

**The** distribution was **Beta(1.2, 0.5)**!

<figure class="blog">
	<img src="/assets/img/factoranalysis/beta1205.png" alt="Beta(1.2,0.5) distribution">
	<figcaption>Beta(1.2, 0.5) distribution</figcaption>
</figure>

The product of two variables from this distribution is approximately uniformly distributed:

<figure class="blog">
	<img src="/assets/img/factoranalysis/beta1205prod.png" alt="Product of Beta(1.2,0.5) variables">
	<figcaption>Product of two Beta(1.2, 0.5)-distributed variables is approximately uniform</figcaption>
</figure>

## Conclusion

As you can see, I successfully completed the project with learning a lot of new things and even contributing a new knowledge which wasn't there before (you can search the Web and see that I am the first to perform a product decomposition of a uniform distribution. To read about my other projects please read my other blog entries. **To hire me, please visit the Collaborate tab or [click here](/collaborate).**  
