# Implementation CI In Android
CI在web-based application上已经有了非常成熟的实现，由此也积累了大量的优秀实践。但这些实践在Android平台中是否适用? 已知的CI工具是否能够很好的支持Android? Android CI是否也能即时的反馈Android Application的健康状况? 这篇文章中将通过我们的实践，一一为大家解答以上问题。
## Why we need CI in Android
#### Reduce Risks
Defect are detected and fixed sooner.
Health of software is measurable
Reduce assumptions such as compatible with third-part library by rebuilding and testing a software on a clean environment using the same process and scripts.
#### Reduce repetitive processes
为了得到一个可发布的Android App，需要经历编译，测试，验证，部署等众多步骤。为了节约出包的时间，减少对资源的消耗，保证步骤都被正确执行。CI可以帮组构建一个可以重复执行的出包流程，并通过不断的优化，缩短时间。这样一个确定的出包步骤能够让开发人员在本地环境快速的完成部署。
#### Generate a deployable software
在每一次微小的App调整后，CI都提供了一个可运行的App。这一点无论是对App的快速发布，还是成果验证都至关重要。产品相关人员可以通过这个可部署的版本快速的体验并确认产品新功能。
#### Enable better project visibility
CI可以项目当前的健康状况即时的通报给整个团队，让团队所有人都关心项目健康。让团队所有人都以项目健康为目标，承担起责任。
#### Establish a greater product confidence
项目在一个透明的环境中运行着，随着项目健康状况的改善，整个团队对于项目的信心也会随之增加。

## CI difference between Android and Web-Based
* Android enviorment is unstable. Emulator would be unresponable sometimes. The command to check whether emulator is started is not reliable.
* Automated framework is not mature.
* The speed of automated test is low.
* There is a lot of version for Android, and we have to make sure it's compatibility for most of Android version

## How to select a CI tool
####Functionality
Build tool should support some essential functionality, such as code compilation, program execution, test execution, build execution, version control tool integration, and feedback.
#### Compatibility with your Environment
#### Reliability
from the size of the user and development community could get know the maturity of CI tool.
#### Longevity
A healthy user base and an established development group
#### Usability
The easier a tool is to configure and use , the better.
We could copy a configuration from existed to other one by jerkins command line.

## Setup CI stages


### Environment preparation
* Setup Java, Android Environment
* Install build tool and version control tool<br/>
本文实践中采用SVN及Ant
* Adapt Jenkins as CI server<br/>
Bamboo和Jenkins(Hudson)是目前使用最多的两个CI构建工具。两者都能很好的满足Android平台的CI环境搭建。两者在工作流方式上的不同设计，CI流程配置的不同。但这不影响完成Android CI的运行。基于Jenkins的低学习成本和免费的优势，本文采用Jenkins搭建CI。Bamboo同样也能完成本文中所有步骤。
Jenkins的安装请参考 <https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins>


### Automate Build Process
Android官方采用Ant作为Build工具，并且基于此提供了一套完整的构建脚本。所以要想在Jenkins中完成构建，是一个轻而易举的事情。本项目中采用了Ant，这不仅因为Android官方推荐，更重要的是因为本项目repository Manager的访问权限限制问题，项目组成员无权直接操作repository Manager。加上项目对外依赖极少，所以放弃使用Maven。

在此我们可以简单讨论Ant和Maven在Android的选择问题：<br/>
Ant和Maven两者目前都已经很好的支持了Android的构建全过程。Ant是Android官方支持的，让人更加信赖。Maven针对Android的插件已经经过一段实践的使用，也已经很可靠。这样就使得两者的取舍脱离了Android平台。

Best Practise:

* 在每一次提交后都对整个project进行构建* 所有人遵循相同的构建顺序，采用同一套构建脚本* 每次构建的时候都执行同一套脚本

### Continuous Testing
Continuous Testing是一种快速收集软件健康状况的方式。为了更好的反馈软件的健康状况，可从UI, Function, Code三个粒度来检测。本文将讨论如果进行不同粒度的测试，并实现Continuous Test。

Android为大家提供了一套集成测试框架，并且在Android4.1及以上版本上又提供了一套UI测试框架。这两套测试框架再加上JUnit，似乎已经为Android开发者提供了一套完善的测试框架，并且充分的满足了三种粒度的需要。但Android developer依然认为Android的自动化测试相当痛苦。由JUnit+Android integration testing framework + Android UI automator构建的Android测试体系存在的问题：

1. 因对于Android SDK的依赖，导致单元测试覆盖率极低<br/>
由于Android组件如Activity, Service和Intent对于SDK的依赖，并且借助Mockito这样的Mock工具解除对于SDK依赖的成本又很高，所以可以认为仅仅依靠JUnit+Mockito无法达到有效的测试覆盖率。
2. Funcion Test实现成本太高，严重影响开发进度<br/>
Android integration testing framework无法与feature结合，这导致每增加一个Function Test都需要较大的开发工作。这将大大延缓开发进度，最终导致Function Test被丢弃。
3. Android UI automator只支持Android4.1及以上平台，导致目前还无法完成UI Testing。

面对以上Android所提供的测试工具存在的问题，Android社区下的developer做了大量的工作来解决这些问题。很多问题已经得到了解决。

1. 采用Robolectric单元测试框架，使得单元测试的测试覆盖率大幅度上升，且理论上可以达到100%。<br/>
测试框架Robolectric是以JUnit为基础，完成了对几乎所有Android组件的stub。经过stub后的Android App组件在JVM中即可运行，无需在Android平台下运行，这也使得Android开发中可以采用TDD的方式。该框架的使用JUnit完全一样，运行性能也一致。
2. 采用Calabash Android功能测试框架。<br/>
目前Android平台下已经出现多种Functiong Testing[实现方案](http://stackoverflow.com/questions/2673746/gui-testing-with-instrumentation-in-android)，在尝试对比后，最终选择了Calabash Android作为解决方案。Calabash Android是Cucumber在Android平台的实现，使用Ruby书写Function Test，并提供了一组操作Anadroid App元素的API。
Calabash Android的主要优势有以下三点：
 	* 对于BDD的支持
 	* 使用Ruby实现Function Test更加的符合自然语言的习惯。使得QA也能轻松的实现Function Test
 	* 支持Android和iOS使用相同的API操作App。使得iOS和Android平台中的Feature可以重用

3. UI Testing暂未有很好的解决方案<br/>
目前Android UI Testing主要以录制回放的机制实现，但录制回放运行效率太低，且对于测试数据和需求的变更过于敏感，在项目中往往经过权衡后放弃使用，在本文也不做进一步讨论。

### Continuous Inspection
Continuous Inspection是对于代码本身检测和反馈。检测主要通过对代码静态分析验证代码风格，编程规范，代码复用，代码语言中的Best Practise等多个维度的代码质量。

Sonar作为一个开源的代码质量检测工具，涵盖了7项代码质量检测方式。这充分满足Android平台下对于代码质量的检测分析。
### Continuous Deployment
由于Android App采用用户手动从Appstore自行下载安装的方式发布，使得Android App无法直接部署至用户手机中。另外Appstore需要对于上线的App进行审核，不能持续进行Release。因而Android中Continuous Deployment将以持续发布可安装包为目标。

在以上目的下，只需根据自身项目资源找到合适的安装包管理工具即可。如本文采用Dropbox来管理所有安装包。
### Continous Feedback
Continuou Feeback的目的就是让项目健康状况对所有人透明。在Continuous Testing, Continuous Inspection和Continuous Deployment阶段中都产生了项目健康状况报告，在此就应该将这些报告以最为有效的方式传递给合适的人。

项目所有人都关心现在项目是否健康，那就应该将项目的总体情况告知所有人。通知的方式有很多中，不一定要采用邮件通知的方式。可以寻找更加有趣的方式，如果播放音乐和设置警报灯。在每一次Build成功或失败后都播放一段有趣的音乐，打开不同颜色的警报灯，是一种简单有效的方式，让项目所有人都获取到最为关键的信息。

Continuous Testing中单元测试报告采用Cobertura进行分析汇报。


