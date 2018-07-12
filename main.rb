require 'twilio-ruby'
require 'sinatra'

use Rack::Session::Cookie, key: 'rack.session',
                           path: '/',
                           secret: 'piephohmeshaebohshic2eiPae6ay0Oe'

get '/sms' do
  content_type 'text/xml'
  twiml = Twilio::TwiML::MessagingResponse.new do |resp|
    resp.message body: INTERVIEW(params['Body'].downcase)
  end
  twiml.to_s
end


require 'facebook/messenger'

include Facebook::Messenger

Bot.on :message do |message|
  message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
  message.sender      # => { 'id' => '1008372609250235' }
  message.seq         # => 73
  message.sent_at     # => 2016-04-22 21:30:36 +0200
  message.text        # => 'Hello, bot!'
  message.attachments # => [ { 'type' => 'image', 'payload' => { 'url' => 'https://www.example.com/1.jpg' } } ]

  message.reply(text: 'Hello, human!')
end

def INTERVIEW(message)



  if session['last-question']
    session[session['last-question']] = message
  end

  ## 0) Situation géographique / lieu :

  if !session['country']
    session['last-question'] = 'country'
    return 'Indiquez votre pays ?'
  end

  ## 0.1) (France) : Ou habitez-vous ?

      # a Ile de france => aller à question 1
      # b Autres => rajouter question 0.1.1 Quel département ? => aller à question 1


  ## 1) Quelle est votre situation professionnelle ?

  # Choisissez toutes les réponses qui vous correspondent

  #     a) Chef d'entreprise / entrepreneur
  #     b) Salarié
  #     c) Demandeur d'emploi
  #     d) Retraité
  #     e) Auto-entrepreneur
  #     f) Étudiant
  #     g) Freelance
  #     h) Autre


  ## 2) Objectif(s)

  # Pourquoi recherchez-vous une formation à la programmation informatique ?
  # Choisissez tous les choix qui vous correspondent

  #     a) pour créer ou perfectionner mon application/site
  #     b) pour recruter des developpeurs
  #     c) pour mieux comprendre les enjeux dans mon travail ou mon domaine de compétence / pour mieux collaborer
  #     d) avec des développeurs
  #     e) pour effectuer une reconversion professionnelle comme développeur (web, logicielle, data, etc.)
  #     f) Autres => si seulement f : "mince on n'a pas dû bien se comprendre


  ## 3) Durée

  if !session['duration']
    session['last-question'] = 'duration'
    return 'Quelle durée maximale pouvez-vous y consacrer ?'
  end


  ## 4) Disponibilités physiques

  # Si country != France ne pas afficher question 4)

  # Quel format de formation privilégiez-vous ?
  # Choisissez toutes ceux qui vous correspondent !

  #     a) distanciel => aller à question 6/langue
  #     b) présentiel => aller à question 7/diplome
  #     c) Je ne sais pas
  #     d) Autre


  ## 5) Disponibilités quotidiennes

  #     a) temps plein
  #     b) temps partiel
  #     c) Je ne sais pas
  #     d) Autre


  ## ▶ 6) Langue

  if !session['english']
    if session['country'] == 'france'

    end
    session['last-question'] = 'english'
    return 'Voulez-vous voir les cursus en anglais ?'
  end


  ## 7) Diplôme (pré-requis de certaines formations)

  if !session['diplome']
    session['last-question'] = 'diplome'
    return 'Quel est votre niveau d\'études ?'
  end


  ## 8) Budget

  if !session['budget']
    session['last-question'] = 'budget'
    return 'Quel est votre budget pour financer cette formation ?'
  end


  ## 9) Disponibilités

  # Jusqu'à quand êtes-vous disponible ?

  #     a) J'indique la date de fin : __/__/__ (intégrer un calendrier?)
  #     b) Je n'ai pas de date
  #     c) Autres

  # Pour savoir quelles sessions de formation proposer. Voir si date de fin de formation est bien inférieure à date fin de dispo.
  # Attention aux salariés ou personnes qui font ça en parallèle d'autres activités


  ## 10) Validation du podium

  return 'Voici trois cursus que nous vous avons sélectionné, sélectionnez les formations qui vous intéressent'

      # a [ ] cursus 1 | Organisme | date début | prix | financement possible |
      # b [ ] cursus 2 | Organisme | date début | prix | financement possible |
      # c [ ] cursus 3 | Organisme | date début | prix | financement possible |
      # d [ ] Aucune


  # ## *Approfondissement du choix :*
  # <br>


  # ## ↪si non-"aucune" (<=> tout sauf le choix "aucune")

  # * ### ↪si une seule sélectionnée (a || b || c) :
  #     * a je m'inscris (ien/formulaire)
  #     * b je préfère avoir quelques renseignements avant de m'inscrire => indique ton numéro pour être rappelé

  # * ### ↪si deux sélectionnés && si trois sélectionnés :

  #     * a je vais fouiller le net pour avoir quelques renseignements avant de m'inscrire => indique ton numéro pour être rappelé
  #     * b je veux bien profiter de vos conseils afin de choisir au mieux => indique ton numéro pour être rappelé


  # <br>

  # ## ↪si "aucune" :
  # >NB : j'ai proposé "être rappelé" mais si on peut switcher direct avec humain dans la même conversation c'est mieux bien sûr

  # => Voyons ensemble ce qui ne vous convient pas afin d'améliorer notre proposition

  #     [ ] la langue ne convient pas => 6/langue => 10/podium

  #     [ ] trop cher => baisser d'un cran dans la réponse 8/budget => "veux-tu être rappelé pour avoir des informations sur les financements possibles?", sinon 10/podium : "voici d'autres formations moins cheres"

  #     [ ] pb avec dispo physique || pb avec dispo quotidienne || pb avec lieu =>
  #         a veux-tu changer ta réponse à cette question ?
  #         b "veux être rappelé pour des conseils ...

  #     [ ] niveau trop facile => rajouter une question sur l'xp en info ? proposer human coders...

  #     [ ] réponse ne m'évoque rien => "je veux être rappelé "

  #     [ ] je veux pas faire de programmation => "tu as répondu "XX" à la question 2/objectifs, peux-tu préciser ?" =>



  # <br><br><br><br>

  # ##  *Questions du questionnaire difficilement utilisables :*
  # ## ▶ Question retrospective


  # 8 Pourquoi n'avez vous pas suivi de formation dans l'informatique avant ? *

  # Sélectionner le thème qui vous a bloqué

  #     Autre
  #     manque de temps
  #     lieu de formation trop éloigné
  #     manque de budget
  #     absence d'une équivalence en crédits universitaires / d'une certification
  #     témoignages/avis négatifs sur la formation
  #     manque d'informations dessus
  #     manque d'accompagnement individualisé dans la formation

  # > trop large => a la limite découper en sous questions pour chacun des themes
  # <br>

  # ## ▶ Critère le plus important

  # 7 Quel est le critère le plus important pour vous : budget, durée, temps, format, autre ?


  # *Pour un diagnostic de meilleur qualité, expliquez-nous votre choix*

  # > question peu informative -> sera remplacé par les feedbacks de fin de questionnaire.. ou par l'échange avec un humain

end
