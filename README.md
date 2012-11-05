# maildir2mbox

License: BSD (see full license in LICENSE file)

Author: Jonathan Clarke <jonathan.clarke@normation.com>

Contributions by Matthieu "Kegeruneku" Cerda

## Presentation

This is a tool to convert mails in a maildir format to mbox mailbox format.

Maildir format is used by many mail servers, and is simply a directory containing one file for each email. Mbox mailbox format is used by other mail servers and various tools (including Mailman, my original itch) and is a big file containing all emails one after the other, separated by a line like "From  sender@email.com  date".

It is basically the opposite of the "mb2md" tool. If this is what you're looking for, you're in the wrong place, mb2md is packaged on most distributions (Debian/Ubuntu: apt-get install mb2md).

Currently, it's extremely simple and can be largely improved, but it did the job for me :) Patches welcome!

## Rationale

This script runs through all files in a maildir, and collects the From email address and Date from the corresponding headers. It then converts the date to the appropriate format for mbox, and outputs a "mbox header line" ("From  sender@email.com  date") followed by the email and a blank line.

## Dependencies

This script relies on a little Perl script, that has a few dependencies: Date::Time and DateTime::Format::Mail

On an APT based distribution, you can install them like this:

    # apt-get install libdatetime-perl libdatetime-format-mail-perl

Of course, you can use aptitude the same way if you want.

## Usage

    $ cd /path/to/your/source/maildir
    $ maildir2mbox > /path/to/your/destination.mbox

Note: The path to the accompanying script "dateRfc3339ToMbox.pl" should be autodetected by maildir2mbox, however if you are using a BSD based system, or you separated maildir2mbox from it, you might want to force the path to this script because the autodetection is likely to fail.

## Example

This is how the operation is done on a Postfix+Courier setup generated maildir, it should be relatively similar on any other standard SMTP+IMAP setup:

    $ tar zvxf my-maildir-export.tar.gz
    $ cd my-maildir-export
    $ ls
    courierimapacl  courierimapkeywords/  courierimapuiddb  cur/  maildirfolder  new/  tmp/
    $ cd cur/
    $ /home/me/maildir2mbox/maildir2mbox > /path/to/your/destination.mbox
    $ cd ../new/
    $ /home/me/maildir2mbox/maildir2mbox >> /path/to/your/destination.mbox

## Output

A primitive progess meter is displayed on stderr:

    Starting up, found 1572 emails
    Converting: 100% done
    Finished.

## Comments and feedback

Comments, feedback and patches are most welcome, either via github or email (jonathan.clarke@normation.com). Enjoy!
