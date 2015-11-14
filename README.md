# catnet
_I CAN HAZ INTERNET?_

## Getting started

1. Install WWW::Mechanize

    ```sh
        $ sudo cpan WWW::Mechanize
    ```

2. Add the following line to your squid.conf

    ```
        url_rewrite_program /path/to/catnet/catnet.pl
    ```

3. Either configure squid as http-proxy or iptables for transparent proxying
4. Done! Enjoy the true interwebs
