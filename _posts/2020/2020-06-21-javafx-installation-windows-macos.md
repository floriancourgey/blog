---
title: JavaFX installation for Windows & MacOS
categories: [java,javafx]
---

Since Java 11, JavaFX is not included in the JDK anymore. Here's how to download it and set it up on both Windows & MacOS!

<p class="text-center">🐍👑🌍</p>

<!--more-->

Note: JDK version earlier than 11 will throw error `Unrecognized option: --module-path`.

## Windows
Make sure you have Java 11+ installed with `java -version`:
```console
> java -version

```

## MacOS

### Prerequisites
Make sure you have Java 11+ installed with `java -version`:
```console
$ java -version
java version "11.0.7" 2020-04-14 LTS
Java(TM) SE Runtime Environment 18.9 (build 11.0.7+8-LTS)
Java HotSpot(TM) 64-Bit Server VM 18.9 (build 11.0.7+8-LTS, mixed mode)
```

If you have a lower version, you may download the JDK 11 from https://www.oracle.com/java/technologies/javase-jdk11-downloads.html

MacOS Java default installation path: `/Library/Java/JavaVirtualMachines/jdk-11.0.7.jdk`

### JavaFX download
- Get JavaFX 11 from https://gluonhq.com/download/javafx-11-0-2-sdk-mac, and unzip it into `~/java/javafx-sdk-11.0.2`.
- Then, create an ENV var to store the JavaFX path `export PATH_TO_FX=/Users/me/java/javafx-sdk-11.0.2/lib`
- Finally, run the HelloWorld JavaFX app from OpenJFX:
```console
$ curl https://raw.githubusercontent.com/openjfx/samples/master/HelloFX/CLI/hellofx/HelloFX.java -o HelloFX.java
$ javac --module-path $PATH_TO_FX --add-modules javafx.controls HelloFX.java
$ java --module-path $PATH_TO_FX --add-modules javafx.controls HelloFX
``` 

![](/assets/images/2020/javafx-hellofx-java.png)

### Eclipse setup
- Open Eclipse, `Help`>`Eclipse Marketplace`>`e(fx)clipse` 3.6.0

![](/assets/images/2020/eclipse-javafx-marketplace.png)

- `Eclipse`>`Preferences`>`User Libraries`>`New`>`"JavaFX"`>`Add external JARs`> Add all JARs from `javafx-sdk-11.0.2/lib`

![](/assets/images/2020/eclipse-javafx-user-libraries.png)

- Right click your project>`Build Path`>`Add libraries`>`JavaFX`
- `Run`>`Run Configurations`>`Arguments`>`VM Arguments`> `--module-path /Users/me/java/javafx-sdk-11.0.2/lib --add-modules javafx.controls,javafx.fxml`

![](/assets/images/2020/eclipse-javafx-run-configuration.png)

NB: do not use `$PATH_TO_FX` in Eclipse VM Arguments as it won't work and will yield
``` console
Error occurred during initialization of boot layer
java.lang.module.FindException: Module javafx.controls not found
```
