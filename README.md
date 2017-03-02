# Nginx on Alpine w/ LDAP Authentication

[![Docker Stars](https://img.shields.io/docker/stars/dweomer/nginx-auth-ldap.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/dweomer/nginx-auth-ldap.svg)][hub]
[![Docker Size](https://images.microbadger.com/badges/image/dweomer/nginx-auth-ldap.svg)](https://microbadger.com/images/dweomer/nginx-auth-ldap "Get your own image badge on microbadger.com")

Built to be compatible with the [official Nginx image](https://hub.docker.com/_/nginx/). Leverages the LDAP authentication module from [kvspb/nginx-auth-ldap](https://github.com/kvspb/nginx-auth-ldap)

Please see [src/test/resources/compose/my-secured-site](src/test/resources/compose/my-secured-site) for an example of how to properly configure.

#####  Copyright Notice
>The [MIT License](LICENSE) ([MIT](https://opensource.org/licenses/MIT))
>
> Copyright &copy; 2017 [Jacob Blain Christen](https://keybase.io/dweomer)
>
> Permission is hereby granted, free of charge, to any person obtaining a copy of
> this software and associated documentation files (the "Software"), to deal in
> the Software without restriction, including without limitation the rights to
> use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
> the Software, and to permit persons to whom the Software is furnished to do so,
> subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all
> copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
> FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
> COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
> IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[hub]: https://hub.docker.com/r/dweomer/nginx-auth-ldap/
[issues]: https://github.com/dweomer/dockerfiles-nginx-auth-ldap/issues
