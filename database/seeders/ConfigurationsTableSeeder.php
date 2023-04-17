<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ConfigurationsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('configurations')->insert([
            [
                'code' => 'SOBRE_MIM',
                'value' => 'Vinicius Araújo é um especialista em casas de alto padrão em condomínio fechado na região de Natal e Parnamirim/RN.',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'code' => 'termos-de-uso',
                'value' => '<h2 class="western" style="text-align:center;">
    Termos de Uso
</h2>
<h2 class="western">
    <span style="color:#444444;">1. Termos</span>
</h2>
<p>
    <span style="color:#444444;">Ao acessar o site </span><a href="https://viniciusaraujocorretor.com.br/">Vinícius Araújo</a><span style="color:#444444;">, concorda em cumprir estes termos de serviço, todas as leis e regulamentos aplicáveis ​​e concorda que é responsável pelo cumprimento de todas as leis locais aplicáveis. Se você não concordar com algum desses termos, está proibido de usar ou acessar este site. Os materiais contidos neste site são protegidos pelas leis de direitos autorais e marcas comerciais aplicáveis.</span>
</p>
<h2 class="western">
    <span style="color:#444444;">2. Uso de Licença</span>
</h2>
<p>
    <span style="color:#444444;">É concedida permissão para baixar temporariamente uma cópia dos materiais (informações ou software) no site Vinícius Araújo , apenas para visualização transitória pessoal e não comercial. Esta é a concessão de uma licença, não uma transferência de título e, sob esta licença, você não pode:&nbsp;</span>
</p>
<p style="margin-bottom:0cm;">
    <span style="color:#444444;">modificar ou copiar os materiais;&nbsp;</span>
</p>
<p style="margin-bottom:0cm;">
    <span style="color:#444444;">usar os materiais para qualquer finalidade comercial ou para exibição pública (comercial ou não comercial);&nbsp;</span>
</p>
<p style="margin-bottom:0cm;">
    <span style="color:#444444;">tentar descompilar ou fazer engenharia reversa de qualquer software contido no site Vinícius Araújo;&nbsp;</span>
</p>
<p style="margin-bottom:0cm;">
    <span style="color:#444444;">remover quaisquer direitos autorais ou outras notações de propriedade dos materiais; ou&nbsp;</span>
</p>
<p>
    <span style="color:#444444;">transferir os materiais para outra pessoa ou "espelhe" os materiais em qualquer outro servidor.</span>
</p>
<p>
    <span style="color:#444444;">Esta licença será automaticamente rescindida se você violar alguma dessas restrições e poderá ser rescindida por Vinícius Araújo a qualquer momento. Ao encerrar a visualização desses materiais ou após o término desta licença, você deve apagar todos os materiais baixados em sua posse, seja em formato eletrónico ou impresso.</span>
</p>
<h2 class="western">
    <span style="color:#444444;">3. Isenção de responsabilidade</span>
</h2>
<p style="margin-bottom:0cm;">
    <span style="color:#444444;">Os materiais no site da Vinícius Araújo são fornecidos "como estão". Vinícius Araújo não oferece garantias, expressas ou implícitas, e, por este meio, isenta e nega todas as outras garantias, incluindo, sem limitação, garantias implícitas ou condições de comercialização, adequação a um fim específico ou não violação de propriedade intelectual ou outra violação de direitos.</span>
</p>
<p>
    <span style="color:#444444;">Além disso, o Vinícius Araújo não garante ou faz qualquer representação relativa à precisão, aos resultados prováveis ​​ou à confiabilidade do uso dos materiais em seu site ou de outra forma relacionado a esses materiais ou em sites vinculados a este site.</span>
</p>
<h2 class="western">
    <span style="color:#444444;">4. Limitações</span>
</h2>
<p>
    <span style="color:#444444;">Em nenhum caso o Vinícius Araújo ou seus fornecedores serão responsáveis ​​por quaisquer danos (incluindo, sem limitação, danos por perda de dados ou lucro ou devido a interrupção dos negócios) decorrentes do uso ou da incapacidade de usar os materiais em Vinícius Araújo, mesmo que Vinícius Araújo ou um representante autorizado da Vinícius Araújo tenha sido notificado oralmente ou por escrito da possibilidade de tais danos. Como algumas jurisdições não permitem limitações em garantias implícitas, ou limitações de responsabilidade por danos conseqüentes ou incidentais, essas limitações podem não se aplicar a você.</span>
</p>
<h2 class="western">
    <span style="color:#444444;">5. Precisão dos materiais</span>
</h2>
<p>
    <span style="color:#444444;">Os materiais exibidos no site da Vinícius Araújo podem incluir erros técnicos, tipográficos ou fotográficos. Vinícius Araújo não garante que qualquer material em seu site seja preciso, completo ou atual. Vinícius Araújo pode fazer alterações nos materiais contidos em seu site a qualquer momento, sem aviso prévio. No entanto, Vinícius Araújo não se compromete a atualizar os materiais.</span>
</p>
<h2 class="western">
    <span style="color:#444444;">6. Links</span>
</h2>
<p>
    <span style="color:#444444;">O Vinícius Araújo não analisou todos os sites vinculados ao seu site e não é responsável pelo conteúdo de nenhum site vinculado. A inclusão de qualquer link não implica endosso por Vinícius Araújo do site. O uso de qualquer site vinculado é por conta e risco do usuário.</span>
</p>
<p>
    &nbsp;
</p>
<h3 class="western">
    <span style="color:#444444;">Modificações</span>
</h3>
<p>
    <span style="color:#444444;">O Vinícius Araújo pode revisar estes termos de serviço do site a qualquer momento, sem aviso prévio. Ao usar este site, você concorda em ficar vinculado à versão atual desses termos de serviço.</span>
</p>
<h3 class="western">
    <span style="color:#444444;">Lei aplicável</span>
</h3>
<p>
    <span style="color:#444444;">Estes termos e condições são regidos e interpretados de acordo com as leis do Vinícius Araújo e você se submete irrevogavelmente à jurisdição exclusiva dos tribunais naquele estado ou localidade.</span>
</p>
<p style="line-height:100%;margin-bottom:0cm;">
    <br>
    &nbsp;
</p>',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'code' => 'politicas-de-privacidade',
                'value' => '<h2 class="western" style="text-align:center;">
    <span style="color:#444444;">Política de Privacidade</span>
</h2>
<p>
    <span style="color:#444444;">A sua privacidade é importante para nós. É política do Vinícius Araújo respeitar a sua privacidade em relação a qualquer informação sua que possamos coletar no site </span><a href="https://viniciusaraujocorretor.com.br/">Vinícius Araújo</a><span style="color:#444444;">, e outros sites que possuímos e operamos.</span>
</p>
<p>
    <span style="color:#444444;">Solicitamos informações pessoais apenas quando realmente precisamos delas para lhe fornecer um serviço. Fazemo-lo por meios justos e legais, com o seu conhecimento e consentimento. Também informamos por que estamos coletando e como será usado.</span>
</p>
<p>
    <span style="color:#444444;">Apenas retemos as informações coletadas pelo tempo necessário para fornecer o serviço solicitado. Quando armazenamos dados, protegemos dentro de meios comercialmente aceitáveis ​​para evitar perdas e roubos, bem como acesso, divulgação, cópia, uso ou modificação não autorizados.</span>
</p>
<p>
    <span style="color:#444444;">Não compartilhamos informações de identificação pessoal publicamente ou com terceiros, exceto quando exigido por lei.</span>
</p>
<p>
    <span style="color:#444444;">O nosso site pode ter links para sites externos que não são operados por nós. Esteja ciente de que não temos controle sobre o conteúdo e práticas desses sites e não podemos aceitar responsabilidade por suas respectivas&nbsp;</span><a href="https://politicaprivacidade.com/" target="_blank"><span style="background-color:transparent;color:#444444;">políticas de privacidade</span></a><span style="color:#444444;">.</span>
</p>
<p>
    <span style="color:#444444;">Você é livre para recusar a nossa solicitação de informações pessoais, entendendo que talvez não possamos fornecer alguns dos serviços desejados.</span>
</p>
<p>
    <span style="color:#444444;">O uso continuado de nosso site será considerado como aceitação de nossas práticas em torno de privacidade e informações pessoais. Se você tiver alguma dúvida sobre como lidamos com dados do usuário e informações pessoais, entre em contacto connosco.</span>
</p>
<h3 class="western">
    <span style="color:#444444;">Compromisso do Usuário</span>
</h3>
<p>
    <span style="color:#444444;">O usuário se compromete a fazer uso adequado dos conteúdos e da informação que o Vinícius Araújo oferece no site e com caráter enunciativo, mas não limitativo:</span>
</p>
<p style="margin-bottom:0cm;">
    <span style="color:#444444;">A) Não se envolver em atividades que sejam ilegais ou contrárias à boa fé e à ordem pública;</span>
</p>
<p style="margin-bottom:0cm;">
    <span style="color:#444444;">B) Não difundir propaganda ou conteúdo de natureza racista, xenofóbica, </span><a href="https://apostasonline.guru/betano-apostas/"><span style="color:#212529;"><span style="text-decoration:none;">betano apostas</span></span></a><span style="color:#444444;"> ou azar, qualquer tipo de pornografia ilegal, de apologia ao terrorismo ou contra os direitos humanos;</span>
</p>
<p>
    <span style="color:#444444;">C) Não causar danos aos sistemas físicos (hardwares) e lógicos (softwares) do Vinícius Araújo, de seus fornecedores ou terceiros, para introduzir ou disseminar vírus informáticos ou quaisquer outros sistemas de hardware ou software que sejam capazes de causar danos anteriormente mencionados.</span>
</p>
<h3 class="western">
    <span style="color:#444444;">Mais informações</span>
</h3>
<p>
    <span style="color:#444444;">Esperemos que esteja esclarecido e, como mencionado anteriormente, se houver algo que você não tem certeza se precisa ou não, geralmente é mais seguro deixar os cookies ativados, caso interaja com um dos recursos que você usa em nosso site.</span>
</p>
<p>
    <span style="color:#444444;">Esta política é efetiva a partir de&nbsp;15 April 2023 17:55</span>
</p>
<p style="line-height:100%;margin-bottom:0cm;">
    <br>
    &nbsp;
</p>',
                'created_at' => now(),
                'updated_at' => now()
            ],
        ]);
    }
}
