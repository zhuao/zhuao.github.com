---
  title: Learn design
  layout: default
  tag: GoF, OO principle,
  author: 
    name: Zhu Ao
    url: http://zhuao.me
  summary: Summarize all the OO principles
    
---

## OO Principle for class
1. SRP Single Responsibility Principle
2. OCP Open Close Principle
3. LSP Liskov Substitution Principle
4. ISP Interface Segregation Principle
5. DIP Dependency Inversion principle 

## Principle for package cohesion
1. REP Resue Release Equivalence principle
2. CCP Common Closure Principle
3. CRP Common Resule Principle

## Principle for package coupling
1. ADP Acyclic Dependencies Principle
2. SDP Stable Dependencies Principle
3. SAP Stable Abstractions Principle

## How to write testable code without TDD
 Please refrence to [this](http://www.objectmentor.com/resources/articles/TestableJava.pdf)

	Never hide Test unfriendly Feature with Test Unfriendly Construct

Test unfriendly Feature:

1. Database/Network/Filesystem access
2. Lengthy computation
2. Inscrutable(It's hard to understand)
1. Static variable usage

Test unfriendly Construct:

1. Final method/class
2. Static method
3. private method
4. Construction/Static initialization expression/block
6. Object initialization block
7. New expression

Conclusion:

Remove static and final could resolve almost 90% untestable code. Checking the code is could be override or subclass could help us analysising the code is testable.

## Gof
### Creational
#### Creation method
Issue:多处出现了创建值不同的对象

Solution:使用创建方法替换构造函数。

Why use:

	1. 更好表达构造对象的种类
	2. 打破构造函数对参数的约束
	3. 发现重复逻辑

Why not use:

	命名规则不统一


#### Factory
Issue:在创建多个对象时存在复杂的逻辑，或者对象的创建散落多处与代码形成了耦合。

Solution:将对象的创建转移至工厂中

Why use:

	1. 合并创建逻辑	
	2. 将客户代码与创建代码解耦

Why not use:

	1. 若可以直接实例化由工厂创建的对象，那这一设计使代码复杂化
	
#### Abstract Factory
Issue: 客户端无需知道所创建对象的具体信息

Solution:让客户端实例化(abstract factory)和获取(to be created object)同一结构的类即可

Why use:
	
	1. 隐藏了不必要公开的类
Why not use:
	
	1. When a new class is created, then we have to add a new create method(modify the basic class).

#### Builder
Issue:需要运行时动态的创建并组合对象。譬如在创建XML时需要组合创建Document,Element,Text等对象

Solution: 创建构造器

Why use:
	
	1. 简化创建代码，减少创建过程中的错误
	2. 不同的运行步骤可以创建出不同的对象值

Why not use:
	
	1. 定义的接口可能无法表达意图

#### Prototype