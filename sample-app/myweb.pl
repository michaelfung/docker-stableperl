use Mojolicious::Lite;

$ENV{TZ} = 'Asia/Hong_Kong';
POSIX::tzset;

plugin SetUserGroup => {user => "nobody", group => "nogroup"};

get '/' => {text => 'Sample Mojolicious App on Docker!'};

get '/term' => sub { exit 0; };

app->start;
