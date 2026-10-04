aardvark-dns). It also includes a small BusyBox 1.36.1 image for an offline
or a different CPU architecture.
it is not an application image. For an application, export its image on a
حزمة Podman غير المتصلة بالإنترنت لـ Ubuntu 24.04 LTS (Noble)، معمارية amd64

تتضمن الحزمة Podman 4.9.3 واعتمادياته لنظام Ubuntu، وأدوات الشبكات للتشغيل دون
صلاحيات الجذر (uidmap وslirp4netns وpasst وaardvark-dns). كما تتضمن صورة BusyBox
1.36.1 صغيرة لاختبار التشغيل دون اتصال. لا تتضمن أدوات بناء الصور الاختيارية.
حجم حزم Debian هو 35.6 ميغابايت، وقد نُزّلت من مستودعات Ubuntu الرسمية.

ثبّت الحزمة على خادم يعمل بـ Ubuntu 24.04 amd64:

  1. فك ضغط podman-offline-ubuntu-24.04-amd64.tar.gz.
  2. من المجلد الناتج، شغّل:

     sh install-offline.sh

  3. تحقّق من التثبيت:

       podman --version
       podman info

  4. حمّل صورة الاختبار وشغّلها دون الاتصال بمستودع صور:

     podman load -i busybox-test.tar
     podman run --rm --pull=never busybox:1.36.1 echo "تم تشغيل Podman دون اتصال"

يحصر المُثبّت مصادر APT في هذا المجلد المحلي، لذلك لا يتصل بمستودعات الشبكة.
إذا غابت حزمة مطلوبة، يتوقف التثبيت. لا تستخدم هذه الحزمة مع إصدار Ubuntu آخر
أو Debian أو معمارية معالج مختلفة.

صورة BusyBox المرفقة مخصصة لاختبار تشغيل الحاويات دون اتصال، وليست صورة تطبيق.
لتشغيل تطبيق، صدّر صورته على جهاز متصل باستخدام `podman save -o image.tar IMAGE`،
وانقل الملف إلى الخادم، ثم حمّله باستخدام `podman load -i image.tar`. شغّل الصورة
مع الخيار `--pull=never` لمنع محاولة الاتصال بمستودع صور.
