# تشغيل Podman دون اتصال بالإنترنت

تحتوي هذه المساحة على حزمة لتثبيت Podman وتشغيل حاوية اختبار في بيئة Ubuntu
غير متصلة بالشبكة.

- [أرشيف الحزمة](podman-offline-ubuntu-24.04-amd64.tar.gz)
- [بصمة SHA-256 للأرشيف](podman-offline-ubuntu-24.04-amd64.tar.gz.sha256)
- [دليل الحزمة](podman-offline-ubuntu-24.04-amd64/README.txt)

الحزمة مخصصة لـ Ubuntu 24.04 LTS ‏amd64، وتتضمن Podman 4.9.3 واعتمادياته
وصورة BusyBox صغيرة لاختبار التشغيل دون اتصال. لا تتضمن صورة تطبيق الإنتاج.

## التثبيت والاختبار

انقل الأرشيف وملف البصمة إلى الخادم، ثم نفّذ:

```sh
sha256sum -c podman-offline-ubuntu-24.04-amd64.tar.gz.sha256
tar -xzf podman-offline-ubuntu-24.04-amd64.tar.gz
cd podman-offline-ubuntu-24.04-amd64
sh install-offline.sh
podman load -i busybox-test.tar
podman run --rm --pull=never busybox:1.36.1 echo "تم تشغيل Podman دون اتصال"
```

يستخدم المُثبّت مستودع الحزم المحلي فقط. لتشغيل تطبيق آخر دون شبكة، صدّر صورته
من جهاز متصل باستخدام `podman save`، وانقل الملف إلى الخادم، ثم حمّله باستخدام
`podman load` وشغّله مع الخيار `--pull=never`.