---
  title:Add checkstyle to project with gradle
  layout:defaul
  tag:checkstyle, gradle
  author:
    name: Zhu, Ao
    url: zhuao.me
	
----

What I want to do is add code style check when we commit code.

###Add task to checkstyle

Two way to add checkstyle:

1. Config plugin

		apply plugin:'checkstyle'
		checkstyle {
    		toolVersion = "5.7"
	    	configFile = file("${projectDir}/config/sun_checks.xml")
	    	failOnViolation = false
		}
	
	**It doesn't work in Android project, since it need declare sourceSets explicity.*
	
2. Config task

        task checkstyle(type: Checkstyle){
            ignoreFailures = true
            configFile file("${rootDir}/setup/checkstyle/sun_checks.xml")
        
            source "${projectDir}/src/main/java"
            include '**/*.java'
            reports {
                xml {
                    destination file("$buildDir/reports/checkstyle/checkstyle_result.xml")
                }
            }
            classpath = files()
        	
        	//Generate the HTML report
            doLast {
                if (file("${buildDir}/reports/checkstyle/checkstyle_result.xml").exists()) {
                    ant.xslt(in: "${buildDir}/reports/checkstyle/checkstyle_result.xml",
                            style:"${rootDir}/setup/checkstyle/checkstyle-noframes-sorted.xsl",
                            force: "true",
                            out:"${buildDir}/reports/checkstyle/checkstyle_reports.html"
                    )
                }
            }
        }   

###Add commit hook to run checkstyle

Add a shell named pre-commit to .git/hooks folder. the shell as following:

        #! /bin/sh
        
        # This file should be placed under .git/hooks/ to run checkstyle every time
        # a commit is made.
        
        # Run the build
        cd Telstra24x7
        gradle :app:checkstyle
        exitCode=$?
        
        read_dom () {
            local IFS=\>
            read -d \< ENTITY CONTENT
            local ret=$?
            TAG_NAME=${ENTITY%% *}
            ATTRIBUTES=${ENTITY#* }
            return $ret
        }
        
        # checkstyle task gives an exit code of 0 even when there are errors so we will check the
        # checkstyle file to see if there are errors
        if [ 0 = $exitCode ]
        then
        
            while read_dom; do
                if [ "$TAG_NAME" == "error" ]; then
                    eval $ATTRIBUTES
                    echo "\033[01;31mPlease format code first!\033[00m"
                    echo "In file ${source}"
                    echo "${message}"
                    exit 1
                fi
            done < $PWD/app/build/reports/checkstyle/checkstyle_result.xml
        
        
        fi
        
        # If exit code is not 0 then there was a failure
        if [ 0 -ne $exitCode ]
        then
            echo "\033[01;31mStatic Analysis failed\033[00m"
            exit 1
        fi
        
        echo "\033[01;32mStatic Analysis completed successfully\033[00m"
        exit 1
        
 
 **Run `chomd +x pre-commit` script to executable file.*
        
###Commit hook to remote repository

Git remote repository doesn't allow to push .git/hooks folder. So we need another way to commit this shell script.

`ln projectDir/pre-commit projectDir/.git/hooks/pre-commit`

**It should create hard systerm link, soft link couldn't been detected by git.*